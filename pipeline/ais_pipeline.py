import os
import sys
import zipfile
import pandas as pd
import psycopg2
from datetime import date, timedelta, datetime
from psycopg2.extras import execute_values
from dotenv import load_dotenv
from downsampling_module import downsample_by_time_and_distance

# Load environment variables
load_dotenv()

# Config
START_DATE = date(2024, 11, 1)
END_DATE = date(2024, 12, 31)
DOWNLOAD_DIR = "./ais_raw"
os.makedirs(DOWNLOAD_DIR, exist_ok=True)

# Database connection using environment variables
conn = psycopg2.connect(
    host=os.getenv('DB_HOST', 'localhost'),
    port=os.getenv('DB_PORT', 5432),
    dbname=os.getenv('DB_NAME', 'postgres'),
    user=os.getenv('DB_USER', 'postgres'),
    password=os.getenv('DB_PASSWORD')
)
cursor = conn.cursor()


def rename_columns(df):
    """
    Rename columns in the DataFrame to match the database schema.
    This function takes a DataFrame and renames its columns to match the
    expected schema for the PostgreSQL database.
    Args:
        df (pd.DataFrame): The DataFrame to rename columns for.
    Returns:
        pd.DataFrame: The DataFrame with renamed columns.
    """
    return df.rename(columns={
        "MMSI": "mmsi",
        "BaseDateTime": "datetime_utc",
        "LAT": "lat",
        "LON": "lon",
        "SOG": "sog",
        "COG": "cog",
        "Heading": "heading",
        "VesselName": "vessel_name",
        "CallSign": "callsign",
        "VesselType": "vessel_type",
        "Status": "status",
        "Length": "length",
        "Width": "width",
        "Draft": "draft",
        "Cargo": "cargo",
        "TransceiverClass": "transceiver_class"
    })


def read_file(day):
    """
    Read the AIS data file for a specific day.
    This function checks if the CSV file exists, and if not, it checks for a ZIP file
    and unzips it. If the CSV file is still not found, it logs the error.
    Args:
        day (datetime.date): The date for which to read the file.
    Returns:
        pd.DataFrame: The DataFrame containing the AIS data.
        str: The name of the file processed.
    """
    file_name = "AIS_" + day.strftime('%Y_%m_%d')
    zip_path = os.path.join(DOWNLOAD_DIR, file_name + ".zip")
    csv_path = os.path.join(DOWNLOAD_DIR, file_name + ".csv")

    # Check if CSV exists, if not check for ZIP and unzip
    if not os.path.exists(csv_path) and os.path.exists(zip_path):
        print(f"Unzipping: {zip_path}")
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(DOWNLOAD_DIR)

    # If CSV still doesn't exist, log the error and return
    if not os.path.exists(csv_path):
        with open("missing_files_log.txt", "a") as log:
            log.write(f"{file_name} not found or failed to unzip\n")
        print(f"Skipping: {file_name} (missing CSV)")
        return None, file_name

    try:
        # Read the CSV file into a DataFrame and return it
        df = pd.read_csv(csv_path, low_memory=False)
        print(f"Loaded CSV: {csv_path}")
        return df, file_name
    except Exception as e:
        print(f"Error reading {csv_path}: {e}")
        return None, file_name


def save_downsampled_csv(df, file_name):
    """
    Save the downsampled DataFrame to a CSV file.
    This function takes a DataFrame, downsample it, and saves it to a CSV file.
    Args:
        df (pd.DataFrame): The DataFrame to downsample and save.
        file_name (str): The name of the file to save the downsampled data.
    """
    try:
        # Save the downsampled DataFrame to CSV
        downsampled_path = os.path.join(DOWNLOAD_DIR, f"{file_name}_downsampled.csv")
        df.to_csv(downsampled_path, index=False)
        print(f"Saved downsampled file: {downsampled_path}")
    except Exception as e:
        print(f"Error saving downsampled CSV: {e}")


def prepare_db_insert(df):
    """
    Prepare data for insertion into the database.
    This function takes a DataFrame, processes it, and returns a list of rows
    ready for insertion into the PostgreSQL database.
    Args:
        df (pd.DataFrame): The DataFrame to process.
    Returns:
        list: A list of rows ready for insertion into the database.
    """
    try:
        df["day"] = pd.to_datetime(df["datetime_utc"]).dt.date

        for col in [
            "length", "width", "draft",
            "sog", "cog", "heading",
            "vessel_type", "status", "cargo"
        ]:
            df[col] = pd.to_numeric(df[col], errors='coerce')

        for col in df.columns:
            df[col] = df[col].apply(lambda x: None if pd.isna(x) else x)

        rows = df[[
            "mmsi", "datetime_utc", "day", "lat", "lon", "sog", "cog", "heading",
            "vessel_name", "callsign", "vessel_type", "status",
            "length", "width", "draft", "cargo", "transceiver_class"
        ]].values.tolist()

        return rows
    except Exception as e:
        print(f"Error preparing insert data: {e}")
        return None


def insert_to_db(rows):
    """
    Insert rows into the database.
    This function takes a list of rows and inserts them into the
    vessel_positions_raw table in the PostgreSQL database.

    Args:
        rows (list): A list of rows to insert into the database.
    """
    try:
        execute_values(cursor,
            """
            INSERT INTO vessel_positions_raw (
                mmsi, datetime_utc, day, lat, lon, sog, cog, heading,
                vessel_name, callsign, vessel_type, status,
                length, width, draft, cargo, transceiver_class
            ) VALUES %s
            """,
            rows
        )
        conn.commit()
        print("Inserted batch into database.")
    except Exception as e:
        print(f"Error during insert: {e}")


def insert_downsampled_to_db(day):
    """
    Insert downsampled data for a specific day into the database.
    This function reads the downsampled CSV file for the given day,
    prepares the data for insertion, and executes the insert operation.

    Args:
        day (datetime.date): The date for which to insert downsampled data.
    """
    file_name = "AIS_" + day.strftime('%Y_%m_%d') + "_downsampled.csv"
    csv_path = os.path.join(DOWNLOAD_DIR, file_name)
    if not os.path.exists(csv_path):
        print(f"File not found: {csv_path}")
        return
    df = pd.read_csv(csv_path, low_memory=False)
    rows = prepare_db_insert(df)

    if rows:
        insert_to_db(rows)
        print("Inserted downsampled data into database.")
    else:
        print("No data to insert into database.")


def refresh_materialized_views():
    """
    Refresh materialized views for optimized query performance.
    This function refreshes all materialized views after data insertion.
    """
    try:
        print("Refreshing materialized views...")
        
        views = ['daily_counts', 'monthly_counts', 'positions_by_mmsi']
        for view in views:
            cursor.execute(f"REFRESH MATERIALIZED VIEW {view};")
            print(f"Refreshed {view}")
        
        conn.commit()
        print("All materialized views refreshed successfully.")
    except Exception as e:
        print(f"Error refreshing materialized views: {e}")


def main_pipeline():
    """
    Main pipeline to process AIS data.
    This function iterates over the date range, reads the raw AIS data,
    downsample it, saves the downsampled data, and inserts it into the database.
    """
    current_day = START_DATE
    while current_day <= END_DATE:
        print(f"Processing {current_day}")
        day_start = datetime.now()

        df, file_name = read_file(current_day)
        if df is not None:
            df = rename_columns(df)
            df_downsampled = downsample_by_time_and_distance(df, distance_threshold_m=300)
            save_downsampled_csv(df_downsampled, file_name)
            rows = prepare_db_insert(df_downsampled)
            if rows:
                insert_to_db(rows)
                print(f"Finished processing {file_name}")
            else:
                print(f"Skipped insertion for {file_name}")
        else:
            print(f"No data to process for {file_name}")

        duration = datetime.now() - day_start
        print(f"Duration for {current_day}: {duration}\n")

        current_day += timedelta(days=1)

    # Refresh materialized views after processing all data
    refresh_materialized_views()

    cursor.close()
    conn.close()
    print("Pipeline complete.")


if __name__ == "__main__":
    if len(sys.argv) == 1:
        # No arguments: run main pipeline
        main_pipeline()
    elif sys.argv[1] == "insert" and len(sys.argv) == 3:
        insert_downsampled_to_db(datetime.strptime(sys.argv[2], '%Y-%m-%d').date())
    else:
        print("Usage:")
        print("  python script.py                # Run main pipeline")
        print("  python script.py insert <file>  # Insert a downsampled CSV")
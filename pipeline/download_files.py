import os
import requests
from datetime import date, timedelta

# Config
BASE_URL = "https://coast.noaa.gov/htdata/CMSP/AISDataHandler/2024/"
START_DATE = date(2024, 9, 23)
END_DATE = date(2024, 10, 29)
DOWNLOAD_DIR = "./ais_raw"

# Dates to omit from download - use this to skip specific dates
# This is useful for avoiding re-downloading files that are already present or for skipping problematic dates
OMIT_DATES = {
    date(2024, 10, 10)
}

os.makedirs(DOWNLOAD_DIR, exist_ok=True)

def download_file(day):
    """Download the AIS data file for a specific day.
    If the file already exists, it will skip downloading."""

    file_name = "AIS_" + day.strftime('%Y_%m_%d') + ".zip"
    url = BASE_URL + file_name
    file_path = os.path.join(DOWNLOAD_DIR, file_name)

    if os.path.exists(file_path):
        print(f"Already downloaded: {file_name}")
        return

    print(f"Downloading: {file_name}")
    try:
        response = requests.get(url, stream=True)
        if response.status_code == 200:
            with open(file_path, 'wb') as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            print(f"Downloaded: {file_name}")
        else:
            print(f"Failed to download {file_name}: {response.status_code}")
    except Exception as e:
        print(f"Error downloading {file_name}: {e}")


# Download loop
current_day = START_DATE
while current_day <= END_DATE:
    if current_day in OMIT_DATES:
        print(f"Skipping (omitted): {current_day}")
    else:
        download_file(current_day)
    current_day += timedelta(days=1)

print("All downloads complete.")

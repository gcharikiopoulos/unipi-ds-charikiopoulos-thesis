import psycopg2
from psycopg2.extras import RealDictCursor
import os

# Database connection parameters
DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_NAME = os.getenv('DB_NAME', 'postgres')
DB_USER = os.getenv('DB_USER', 'postgres')
DB_PASSWORD = os.getenv('DB_PASSWORD', '051082')

def get_db_connection():
    conn = psycopg2.connect(
        host=os.getenv('DB_HOST', 'localhost'),
        database=os.getenv('DB_NAME', 'postgres'),
        user=os.getenv('DB_USER', 'postgres'),
        password=os.getenv('DB_PASSWORD'),
        port=os.getenv('DB_PORT', '5432')
    )
    
    return conn

def load_trajectory_data_2():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    
    query = f"""
    SELECT
        mmsi,
        lat,
        lon,
        datetime_utc,
        CASE
            WHEN vessel_type = 30 THEN 'fishing'
            WHEN vessel_type BETWEEN 60 AND 69 THEN 'passenger'
            WHEN vessel_type BETWEEN 70 AND 79 THEN 'cargo'
            WHEN vessel_type BETWEEN 80 AND 89 THEN 'tanker'
        END AS vessel_category
    FROM
        vessel_trajectories_gulf_2024
    WHERE
        vessel_type = 30
        OR (vessel_type BETWEEN 60 AND 69)
        OR (vessel_type BETWEEN 70 AND 79)
        OR (vessel_type BETWEEN 80 AND 89);
    """
    print("Executing query:", query) 
    cursor.execute(query)

    data = cursor.fetchall()
    cursor.close()
    conn.close()

    return data
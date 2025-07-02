import math
import pandas as pd


def haversine_distance(lat1, lon1, lat2, lon2):
    """Calculate the Haversine distance between two points 
    on the Earth specified in decimal degrees.
    This function returns the distance in meters."""
    R = 6371000 # Earth radius in meters
    phi1, phi2 = math.radians(lat1), math.radians(lat2)
    d_phi = math.radians(lat2 - lat1)
    d_lambda = math.radians(lon2 - lon1)

    a = math.sin(d_phi / 2)**2 + math.cos(phi1) * math.cos(phi2) * math.sin(d_lambda / 2)**2
    
    return R * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))


def filter_by_distance(vessel_df, distance_threshold_m):
    """Filter vessel positions by distance threshold, keeping only points that are 
    at least distance_threshold_m apart from the previous kept point."""
    if len(vessel_df) == 0:
        return vessel_df
    
    filtered = [vessel_df.iloc[0]]
    for i in range(1, len(vessel_df)):
        prev = filtered[-1]
        curr = vessel_df.iloc[i]
        dist = haversine_distance(prev['lat'], prev['lon'], curr['lat'], curr['lon'])
        if dist >= distance_threshold_m:
            filtered.append(curr)
    
    return pd.DataFrame(filtered)


def downsample_by_time_and_distance(df, distance_threshold_m=300):
    """Downsample AIS data by time and distance.
    This function performs the following steps:
    1. Ensures the 'datetime_utc' column is in datetime format.
    2. Rounds the 'datetime_utc' to the nearest hour.
    3. Groups by 'mmsi' and 'hour', keeping the first position for each hour.
    4. Applies a distance filter sequentially per vessel to keep points that are
    at least distance_threshold_m apart from the previous kept point."""

    # Ensure datetime is in datetime format
    df['datetime_utc'] = pd.to_datetime(df['datetime_utc'])

    # Round datetime to hour and group
    df['hour'] = df['datetime_utc'].dt.floor('h')

    # Sort for stable ordering
    df = df.sort_values(by=['mmsi', 'datetime_utc'])

    # Step 1: Keep one position per vessel per hour (first point)
    hourly_sampled = df.groupby(['mmsi', 'hour'], as_index=False).first()

    # Step 2: Apply distance filter sequentially per vessel
    result = hourly_sampled.groupby('mmsi', group_keys=False).apply(
        lambda vessel_df: filter_by_distance(vessel_df, distance_threshold_m)
    ).reset_index(drop=True)
    
    return result
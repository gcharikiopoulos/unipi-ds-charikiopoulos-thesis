"""
Vessel data service module.
Handles all vessel-related database operations and business logic.
"""
import simplejson as json
from datetime import datetime, timezone
from app.database.db import RealDictCursor, get_db_connection


class VesselService:
    """Service class for vessel data operations."""
    
    # Vessel type mapping for filtering
    VESSEL_TYPE_MAP = {
        "fishing":       (30, 30),
        "towing":        (31, 32),
        "special_ops":   (33, 35),
        "sailing":       (36, 36),
        "pleasure":      (37, 37),
        "hsc":           (40, 49),
        "service":       (50, 59),
        "passenger":     (60, 69),
        "cargo":         (70, 79),
        "tanker":        (80, 89),
        "other":         (90, 99)
    }
    
    # Data range constraints
    EARLIEST_DATE = datetime(2024, 1, 1, 0, 0, 0, tzinfo=timezone.utc)
    LATEST_DATE = datetime(2024, 12, 31, 23, 59, 59, tzinfo=timezone.utc)
    
    @staticmethod
    def validate_request_params(bbox, start_dt, end_dt):
        """Validate and parse request parameters."""
        if not bbox or not start_dt or not end_dt:
            return None, "Missing required parameters"
        
        try:
            west, south, east, north = map(float, bbox.split(","))
            start_ts = datetime.fromisoformat(start_dt)
            end_ts = datetime.fromisoformat(end_dt)
        except (ValueError, TypeError):
            return None, "Invalid parameter format"
        
        if not (VesselService.EARLIEST_DATE <= start_ts <= VesselService.LATEST_DATE):
            return None, "Start date out of range"
        
        if not (VesselService.EARLIEST_DATE <= end_ts <= VesselService.LATEST_DATE):
            return None, "End date out of range"
        
        return {
            'bbox': (west, south, east, north),
            'start_ts': start_ts,
            'end_ts': end_ts
        }, None
    
    @staticmethod
    def fetch_vessel_positions(bbox, start_dt, end_dt, vessel_type=None):
        """Fetch vessel positions from database with filters."""
        # Validate parameters
        params, error = VesselService.validate_request_params(bbox, start_dt, end_dt)
        if error:
            return []
        
        west, south, east, north = params['bbox']
        start_ts = params['start_ts']
        end_ts = params['end_ts']
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        sql = """
            SELECT * FROM vessel_positions_raw
            WHERE lon BETWEEN %s AND %s
              AND lat BETWEEN %s AND %s
              AND datetime_utc BETWEEN %s AND %s
        """
        query_params = [west, east, south, north, start_ts, end_ts]
        
        # Add vessel type filter if specified
        if vessel_type and vessel_type != "all":
            if vessel_type in VesselService.VESSEL_TYPE_MAP:
                low, high = VesselService.VESSEL_TYPE_MAP[vessel_type]
                sql += " AND vessel_type BETWEEN %s AND %s"
                query_params.extend([low, high])
        
        cursor.execute(sql, query_params)
        data = cursor.fetchall()
        cursor.close()
        conn.close()
        
        return data
    
    @staticmethod
    def fetch_medoids_trajectories():
        """
        Fetch medoids trajectories for specific vessels.
        
        These MMSI values should be updated after running DTW clustering analysis
        in notebooks/dtw_clustering.ipynb. Follow these steps to update:
        
        1. Run the clustering analysis notebook
        2. Copy the best_medoids_mmsi values from the output
        3. Update the MMSI list below
        4. Restart the Flask application
        
        Current medoids are based on clustering analysis from: [UPDATE DATE]
        """
        # You can replace this with medoid MMSIs you obtained from clustering analysis
        medoid_mmsis_array = [
            367321850,  # Medoid for cluster 0
            368323490,  # Medoid for cluster 1
            371557000,  # Medoid for cluster 2
            367151590  # Medoid for cluster 3
        ]
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        try:
            # Create placeholder string for IN clause
            medoid_mmsis_placeholders = ','.join(['%s'] * len(medoid_mmsis_array))
            
            sql = f"""
                SELECT 
                    mmsi, 
                    vessel_name, 
                    vessel_type, 
                    ARRAY_AGG(ARRAY[lat, lon] ORDER BY datetime_utc) AS trajectory,
                    COUNT(*) as point_count,
                    MIN(datetime_utc) as start_time,
                    MAX(datetime_utc) as end_time
                FROM vessel_positions_raw
                WHERE mmsi IN ({medoid_mmsis_placeholders})
                GROUP BY mmsi, vessel_name, vessel_type
                ORDER BY mmsi
            """
            
            cursor.execute(sql, medoid_mmsis_array)
            data = cursor.fetchall()
            return data
            
        except Exception as e:
            print(f"Error in fetch_medoids_trajectories: {e}")
            print(f"MMSI array: {medoid_mmsis_array}")
            raise e
        finally:
            cursor.close()
            conn.close()

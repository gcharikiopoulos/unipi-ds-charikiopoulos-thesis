"""
Data processing service module.
Handles data transformation and formatting operations.
"""
import simplejson as json
import pandas as pd
from datetime import date, datetime


class DataService:
    """Service class for data processing operations."""
    
    @staticmethod
    def prepare_json_response(data):
        """
        Convert database query results to JSON response.
        Handles DataFrame conversion, NaN replacement, and datetime serialization.
        """
        if not data:
            return json.dumps([])
        
        # Convert list of dicts to DataFrame
        df = pd.DataFrame(data)
        
        # Replace NaNs with None
        df = df.where(pd.notna(df), None)
        
        # Convert datetime/date columns to string
        for col in df.columns:
            if len(df) > 0 and isinstance(df[col].iloc[0], (pd.Timestamp, date, datetime)):
                df[col] = df[col].astype(str)
        
        # Return JSON
        return json.dumps(df.to_dict(orient="records"), ignore_nan=True)
    
    @staticmethod
    def prepare_simple_json_response(data):
        """
        Convert simple data structures to JSON response.
        For non-DataFrame data that doesn't need pandas processing.
        """
        return json.dumps(data, default=str, ignore_nan=True)

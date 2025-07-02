from flask import Blueprint, render_template, Response, request
import json
from app.services.vessel_service import VesselService
from app.services.data_service import DataService

main = Blueprint('main', __name__)


@main.route('/')
def index():
    """Render the main application page."""
    return render_template('index.html')


@main.route('/data', methods=['GET'])
def get_vessel_positions():
    """Get vessel positions based on query parameters."""
    bbox = request.args.get("bbox")
    start_dt = request.args.get("start_datetime")
    end_dt = request.args.get("end_datetime")
    vessel_type = request.args.get("vessel_type")
    
    # Fetch data using service
    raw_data = VesselService.fetch_vessel_positions(bbox, start_dt, end_dt, vessel_type)
    
    # Prepare and return JSON response
    response_json = DataService.prepare_json_response(raw_data)
    return Response(response_json, content_type="application/json")


@main.route('/medoids_trajectories', methods=['GET'])
def medoids_trajectories():
    """Fetch medoids trajectories for specific vessels."""
    try:
        data = VesselService.fetch_medoids_trajectories()
        response_json = DataService.prepare_simple_json_response(data)
        return Response(response_json, content_type="application/json")
    except Exception as e:
        print(f"Error in medoids_trajectories route: {e}")
        return Response(
            json.dumps({"error": str(e)}), 
            status=500, 
            content_type="application/json"
        )

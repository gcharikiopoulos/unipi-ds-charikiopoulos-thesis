# unipi-ds-charikiopoulos-thesis
Charikiopoulos George - University thesis

# AIS Vessel Viewer

This project visualizes AIS (Automatic Identification System) vessel trajectories in US waters during 2024. It consists of:

- A Flask back-end serving raw and clustered vessel position data from PostgreSQL  
- A Leaflet-powered front-end to show markers, heatmap, and cluster medoids  
- Data ingestion/downsampling scripts and a Jupyter notebook for DTW clustering  

## Features

- **Real-time visualization** of vessel trajectories on an interactive map
- **Heatmap visualization** for vessel density analysis
- **DTW-based clustering** of vessel trajectories using Jupyter notebooks
- **Filtering capabilities** by date range, vessel type, and geographic area
- **Cluster medoid display** showing representative trajectory patterns

---

## Setup Instructions

### 1. Clone Repository & Set Up Python Environment

```bash
git clone https://github.com/gcharikiopoulos/unipi-ds-charikiopoulos-thesis.git
cd unipi-ds-charikiopoulos-thesis

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Upgrade pip and install dependencies
pip install --upgrade pip
pip install Flask psycopg2-binary python-dotenv pandas simplejson requests
pip install tslearn matplotlib tabulate numpy jupyter seaborn
```

### 2. PostgreSQL Database Setup

#### Install PostgreSQL
1. Download and install PostgreSQL from [https://www.postgresql.org/download/](https://www.postgresql.org/download/)
2. Make sure PostgreSQL service is running
3. Create a database (if not using the default 'postgres' database)

#### Initialize Database Schema
Run the database setup script to create the required tables and views:

```bash
# Connect to PostgreSQL and run the setup script
psql -U postgres -d postgres -f app/database/sql/db_setup.sql

# Create partitions for efficient data storage
psql -U postgres -d postgres -f app/database/sql/create_partitions.sql
```

#### Load AIS Data - Choose One Option:

**Option 1: Full Pipeline (Download, Process & Load)**
Download raw AIS data from NOAA, process/downsample it, and load into PostgreSQL.
- Most comprehensive but time-consuming
- Requires significant disk space and processing time
- See detailed instructions: [PIPELINE_SETUP.md](PIPELINE_SETUP.md)

**Option 2: Process Existing Downsampled Files**
Use pre-existing downsampled CSV files and load them into PostgreSQL.
- Faster than Option 1, but requires downsampled CSV files
- Good for custom data processing workflows
- See detailed instructions: [CSV_SETUP.md](CSV_SETUP.md)

**Option 3: Load from SQL Dump (Recommended)**
Load pre-processed data directly from an SQL dump file.
- Fastest and simplest setup
- Complete dataset ready to use
- **Recommended for quick setup**

```bash
# Load the complete database with AIS data
psql -U postgres -d postgres -f app/database/sql/ais_database_20250701.sql
```


### 3. Environment Configuration

Create a `.env` file in the project root directory with your database configuration:

```env
# Database Configuration
DB_HOST=localhost
DB_NAME=postgres
DB_USER=postgres
DB_PASSWORD={{your_password_here}}

# Flask Configuration
FLASK_ENV=development
FLASK_APP=ais_server.py
```

### 4. Running the Flask Application

#### Start the Flask Server

```bash
# Make sure your virtual environment is activated
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# Run the Flask application
python -m ais_server
```

The application will start on `http://localhost:5000` by default.

#### Alternative: Using Flask CLI

```bash
# Set environment variables
export FLASK_APP=ais_server.py
export FLASK_ENV=development

# Run with Flask CLI
flask run
```

---

## Using the Leaflet Map Interface

### Accessing the Map
1. Open your web browser and navigate to `http://localhost:5000`
2. The main interface displays an interactive Leaflet map centered on US waters

### Map Features and Controls

#### Filter Panel (Left Sidebar)
The sidebar dynamically switches between two modes based on your visualization choice:

**Standard Mode (Markers & Heatmap):**
- **Date Range Picker**: Select start and end dates for vessel data (defaults to Jan 1, 2024, 00:00-01:00 UTC)
- **Vessel Type Filter**: Choose specific vessel types (fishing, cargo, tanker, passenger, etc.)
- **Summary Panel**: Real-time statistics showing vessel count, geographic bounds, and filter settings

**Medoids Mode (Trajectory Clustering):**
- **Trajectory Toggles**: Individual checkboxes to show/hide specific medoid trajectories
- **Color-coded Labels**: Each trajectory has a unique color for easy identification
- **Cluster Information**: Details about representative vessel patterns from DTW clustering

#### Map Visualization Options
- **Vessel Markers**: Individual vessel positions with dynamic icons based on vessel type and movement
  - Moving vessels: Arrow-shaped icons oriented by heading/course
  - Stationary vessels: Circular icons
  - Color-coded by vessel type (cargo=green, tanker=red, passenger=blue, etc.)
- **Heatmap Mode**: Density visualization for high-volume data analysis
- **Medoids Mode**: Representative trajectory patterns showing clustered vessel movements

#### Interactive Controls
- **View Switching**: Three buttons to switch between Markers, Heatmap, and Medoids views
- **Dynamic Loading**: Data automatically refreshes when changing map bounds or filters
- **Popup Information**: Click any marker or trajectory for detailed vessel information
- **Zoom/Pan**: Standard map controls with automatic data optimization

#### Smart Data Management
- **Automatic Fallback**: If too many markers are requested (>10,000), automatically switches to heatmap
- **Caching**: Intelligent caching prevents unnecessary data requests when switching views
- **Real-time Updates**: Map data refreshes automatically when you pan or zoom
- **Error Handling**: Graceful handling of network issues and missing data

---

## Jupyter Notebook Analysis Workflow

This project includes a Jupyter notebook for trajectory clustering analysis using TimeSeriesKMeans with DTW (Dynamic Time Warping) distance metric. The notebook identifies representative vessel movement trajectories (medoids) that integrate with the web application.

**Key Features:**
- **TimeSeriesKMeans with DTW Clustering**: Groups similar vessel trajectories using TimeSeriesKMeans with Dynamic Time Warping
- **Medoid Extraction**: Identifies representative trajectories for each cluster
- **Reproducible Analysis**: Fixed random seeds ensure consistent results
- **Flask Integration**: Manual workflow to update medoids in the web application

For detailed instructions on running the clustering analysis and integrating medoids with the web application, see: **[JUPYTER_SETUP.md](JUPYTER_SETUP.md)**

---

## Project Structure

```
unipi-ds-charikiopoulos-thesis/
├── ais_server.py                 # Flask application entry point
├── config.py                     # Configuration settings
├── .env                          # Environment variables (create this)
├── README.md                     # Main documentation (this file)
├── PIPELINE_SETUP.md            # Detailed instructions for Option 1 (full pipeline)
├── CSV_SETUP.md                 # Detailed instructions for Option 2 (CSV processing)
├── JUPYTER_SETUP.md             # Jupyter notebook analysis workflow and medoid integration
├── app/
│   ├── __init__.py              # Flask app factory
│   ├── database/
│   │   ├── db.py                # Database connection and queries
│   │   └── sql/                 # SQL scripts for database setup and optimization
│   ├── routes/
│   │   └── routes.py            # Flask routes and API endpoints
│   ├── services/                # Business logic services
│   │   ├── vessel_service.py    # Vessel data operations
│   │   └── data_service.py      # Data processing utilities
│   ├── static/                  # Static files (CSS, JS, images) + downsampled CSVs (if applicable)
│   └── templates/
│       └── index.html           # Main HTML template
├── notebooks/                   # Jupyter notebooks for analysis
│   ├── dtw_clustering.ipynb     # DTW clustering analysis
│   └── exploratory_analysis.ipynb
└── pipeline/                    # Data processing scripts
    ├── ais_pipeline.py          # Main data ingestion pipeline
    ├── download_files.py        # Data download utilities
    └── downsampling_module.py   # Data preprocessing
```

---

## Troubleshooting

### Common Issues

#### Database Connection Errors
- Verify PostgreSQL is running: `pg_ctl status`
- Check database credentials in `.env` file
- Ensure database exists: `psql -U postgres -l`

#### Flask Application Errors
- Check virtual environment is activated
- Verify all dependencies are installed: `pip list`
- Check for port conflicts (default: 5000)

#### Map Not Loading
- Verify Flask server is running
- Check browser console for JavaScript errors
- Ensure static files are properly served

#### Jupyter Notebook Issues
- Install required packages: `pip install jupyter tslearn matplotlib`
- Check database connection in notebook cells
- Verify data exists in PostgreSQL tables

### Performance Optimization

#### Database Performance
- Ensure proper indexing on `mmsi` and `datetime_utc` columns
- Regularly refresh materialized views: `REFRESH MATERIALIZED VIEW daily_counts;`
- Consider partitioning for large datasets

#### Frontend Performance
- Limit the number of markers displayed on the map
- Use clustering for dense data points
- Implement data pagination for large datasets

---

## License

This project is part of a university thesis and is intended for academic purposes.


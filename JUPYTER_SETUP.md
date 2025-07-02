# Jupyter Notebook Analysis Workflow

This document provides comprehensive instructions for performing DTW (Dynamic Time Warping) clustering analysis on AIS vessel trajectories using Jupyter notebooks. The workflow is designed to identify representative vessel movement patterns (medoids) that can be visualized in the main AIS Vessel Viewer web application.

**What this workflow accomplishes:**
- Analyzes vessel trajectory data from PostgreSQL using reproducible clustering methods
- Identifies optimal cluster configurations using silhouette score analysis  
- Extracts representative trajectory patterns (medoids) for each cluster
- Provides formatted output for easy integration with the Flask web application
- Ensures reproducible results through fixed random seeds and consistent methodology

The medoid integration is a **manual process** that connects the DTW clustering analysis with the Flask web application. This ensures reproducible results and gives you full control over when and how medoids are updated.

---

## Setting Up Jupyter Environment

```bash
# Ensure virtual environment is activated
venv\Scripts\activate  # Windows
# source venv/bin/activate  # macOS/Linux

# Start Jupyter Notebook
jupyter notebook

# Navigate to the notebooks/ directory
```

## DTW Clustering Analysis

Open `notebooks/dtw_clustering.ipynb` to perform **reproducible** trajectory clustering analysis. The notebook uses fixed random seeds to ensure consistent results across runs.

### Step 1: Reproducible Data Preparation
```python
# The notebook uses RANDOM_SEED = 42 for reproducibility
# Connects to your PostgreSQL database
# Loads vessel trajectory data based on specified criteria
# Filters and preprocesses data for clustering with consistent results
```

### Step 2: Reproducible DTW Clustering
```python
# Performs Dynamic Time Warping (DTW) based clustering with fixed random_state
# Groups similar vessel trajectories together consistently
# Calculates cluster medoids (representative trajectories)
# Results are reproducible due to fixed random seeds
```

### Step 3: Manual Medoid Integration
The notebook includes a helper cell that formats medoid data for easy manual integration:

```python
# The final cell outputs clustering results in this format:
# ============================================================
# MEDOIDS EXPORT FOR FLASK APPLICATION
# ============================================================
# 
# 1. BEST CLUSTERING RESULTS:
#    Best k: 4
#    Silhouette Score: 0.4451
#    Number of clusters: 4
# 
# 2. MEDOID VESSEL IDs (MMSIs):
#    Copy these values to app/services/vessel_service.py
#    Replace the medoid_mmsis_array in fetch_medoids_trajectories()
# 
#    Python list format:
#    medoid_mmsis_array = [
#        367321850,  # Medoid for cluster 0
#        368323490,  # Medoid for cluster 1
#        371557000,  # Medoid for cluster 2
#        367151590   # Medoid for cluster 3
#    ]
```

### Step 4: Manual Flask Application Update
After running the clustering analysis:

1. **Run Final Cell**: Execute the last cell in the notebook to get formatted output
2. **Copy Medoid List**: Copy the `medoid_mmsis_array` values from the notebook output
3. **Edit Service File**: Open `app/services/vessel_service.py` 
4. **Update Medoid Array**: Replace the `medoid_mmsis_array` list in `fetch_medoids_trajectories()` method
5. **Update Date Comment**: Add the analysis date to the comment for tracking
6. **Refresh Browser**: The Flask app auto-reloads - simply refresh your browser
7. **Verify Results**: Check the Medoids view in the web interface

### Manual Integration Example
```python
# In app/services/vessel_service.py, update this section:
medoid_mmsis_array = [
    367321850,  # Medoid for cluster 0
    368323490,  # Medoid for cluster 1  
    371557000,  # Medoid for cluster 2
    367151590   # Medoid for cluster 3
]
```

**Important**: This process is completely manual by design to ensure:
- **Reproducible Results**: Fixed random seeds guarantee consistent clustering
- **Full Control**: You decide when and which medoids to integrate
- **Quality Assurance**: Manual review allows validation before deployment
- **Transparency**: Clear audit trail of when medoids were updated

Copy this list to `vessel_service.py` and refresh your browser to see the updated medoids.

---

## Integrating Medoids with the Map

The application includes a streamlined medoids visualization system that integrates directly with your clustering analysis:

### Current Implementation
1. **Backend Service**: The `VesselService.fetch_medoids_trajectories()` method serves cluster medoid data
2. **Frontend Integration**: JavaScript automatically loads and displays medoid trajectories
3. **Interactive Controls**: Users can toggle individual trajectories on/off using checkboxes
4. **Visual Design**: Each medoid trajectory is color-coded and labeled with vessel information

### Workflow: From Clustering Analysis to Visualization

**Step 1: Run DTW Clustering**
```bash
# Start Jupyter and run the clustering notebook
jupyter notebook
# Open: notebooks/dtw_clustering.ipynb
# Run all cells to completion
```

**Step 2: Export Medoid Data**
The notebook's final cell provides a formatted export:
```python
# Actual output format from clustering:
medoid_mmsis_array = [
    367321850,  # Medoid for cluster 0
    368323490,  # Medoid for cluster 1
    371557000,  # Medoid for cluster 2
    367151590   # Medoid for cluster 3
]
```

**Step 3: Update Backend Configuration**
```python
# Edit: app/services/vessel_service.py
# In fetch_medoids_trajectories() method:

def fetch_medoids_trajectories():
    # Replace this list with your clustering results:
    medoid_mmsis_array = [
        367321850,  # Your medoid MMSIs from clustering
        368323490,
        371557000,
        367151590
        # Add more as needed
    ]
    # ... rest of method unchanged
```

**Step 4: Apply Changes**
```bash
# No server restart needed - Flask auto-reloads when files change
# Simply refresh your browser to see the updated medoids
```

**Step 5: Verify Results**
1. Open the web interface: `http://localhost:5000`
2. Click the "Medoids" button to switch to trajectory view
3. Use checkboxes to toggle individual medoid trajectories
4. Verify trajectories match your clustering analysis

---

### Medoid Visualization Features
- **Trajectory Lines**: Polylines showing the complete path of each medoid vessel
- **Vessel Markers**: Markers at trajectory start points with vessel-specific icons
- **Popup Information**: Click trajectories or markers for detailed vessel data
- **Toggle Controls**: Individual checkboxes to show/hide specific trajectories
- **Color Coding**: Unique colors for easy trajectory identification

---

## Additional Notebook

### exploratory_analysis.ipynb
This notebook provides comprehensive exploratory analysis of individual vessel behavior patterns and temporal activity. Use this notebook to understand vessel movement characteristics before performing clustering analysis.

**Key Features:**
- Individual vessel trajectory visualization with start/end markers
- Daily, monthly, and hourly activity pattern analysis
- Movement state classification (static vs. moving behavior)
- Speed profile analysis and distribution statistics
- Activity heatmaps showing temporal patterns by day of week and hour
- Geographic coverage analysis and trajectory statistics
- Temporal feature extraction and visualization

**Typical Use Cases:**
- Understanding vessel behavior before clustering analysis
- Identifying interesting vessels for detailed trajectory analysis
- Validating data quality and coverage
- Exploring temporal patterns in maritime activity
- Generating insights for research or operational analysis

# unipi-ds-charikiopoulos-thesis
Charikiopoulos George - University thesis

# AIS Vessel Viewer

This project visualizes AIS (Automatic Identification System) vessel trajectories in US waters during 2024. It consists of:

- A Flask back-end serving raw and clustered vessel position data from PostgreSQL  
- A Leaflet-powered front-end to show markers, heatmap, and cluster medoids  
- Data ingestion/downsampling scripts and a Jupyter notebook for DTW clustering  

---

## 🚀 Quickstart

### 1. Clone & Python dependencies

```bash
git clone <your-repo-url>
cd <your-repo-folder>
python3 -m venv venv
source venv/bin/activate          # on Windows: venv\Scripts\activate
pip install --upgrade pip
pip install Flask psycopg2-binary python-dotenv pandas simplejson requests


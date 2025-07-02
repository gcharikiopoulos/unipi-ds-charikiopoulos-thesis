# CSV Setup - Process Existing Downsampled Files

This guide covers loading pre-existing downsampled CSV files into PostgreSQL, bypassing the download and initial processing steps.

## Overview

This option is ideal when you:
- Already have downsampled AIS CSV files
- Want to reload specific dates into the database
- Need to reprocess data with different parameters
- Are working with data shared by someone else

**Time Requirements:**
- Processing and data loading: ~3~ minutes per day of data

**Prerequisites:**
- Downsampled CSV files in the correct format
- Files placed in the appropriate directory structure

---

## Step 1: Prepare CSV Files

### Directory Structure

Place your downsampled CSV files in the following directory:

```
app/static/files/ais_raw/01-downsampled/
├── AIS_2024_01_01_downsampled.csv
├── AIS_2024_01_02_downsampled.csv
├── AIS_2024_01_03_downsampled.csv
└── ...
```

### Expected CSV Format

Your CSV files should have the following columns:

```csv
mmsi,datetime_utc,lat,lon,sog,cog,heading,vessel_name,vessel_type,status,length,width,draft,cargo,transceiver_class,callsign
367123456,2024-01-01 00:00:00,40.7128,-74.0060,10.5,45.0,44,VESSEL_NAME,70,0,150,25,8.5,1234,A,WXY123
```

**Required Columns:**
- `mmsi`: Maritime Mobile Service Identity (vessel identifier)
- `datetime_utc`: UTC timestamp in YYYY-MM-DD HH:MM:SS format
- `lat`: Latitude in decimal degrees
- `lon`: Longitude in decimal degrees
- `sog`: Speed over ground in knots
- `cog`: Course over ground in degrees
- `heading`: Vessel heading in degrees (511 = not available)
- `vessel_name`: Vessel name
- `vessel_type`: AIS vessel type code
- `status`: Navigation status
- `length`: Vessel length in meters
- `width`: Vessel width in meters
- `draft`: Vessel draft in meters
- `cargo`: Cargo type code
- `transceiver_class`: AIS transceiver class
- `callsign`: Radio call sign

**Note**: All columns are required for database insertion. Missing columns will cause processing errors.

---

## Step 2: Configure Pipeline

### Set Date Range

Edit `pipeline/ais_pipeline.py` to configure which files to process:

```python
# Processing configuration
START_DATE = date(2024, 1, 1)     # First date to process
END_DATE = date(2024, 1, 31)      # Last date to process

# Directory containing downsampled CSV files
PROCESSED_DATA_DIR = "./app/static/files/ais_raw/01-downsampled/"
```

### Verify File Names

Ensure your CSV files follow the naming convention:
- Format: `AIS_YYYY_MM_DD_downsampled.csv`
- Examples: 
  - `AIS_2024_01_01_downsampled.csv`
  - `AIS_2024_12_31_downsampled.csv`

---

## Step 3: Load Data into Database

### Option A: Process All Files in Date Range

```bash
# Make sure you're in the project root directory
cd unipi-ds-charikiopoulos-thesis

# Make sure your virtual environment is activated
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# Process all CSV files in the configured date range
python pipeline/ais_pipeline.py
```

This will:
1. Read all CSV files between START_DATE and END_DATE
2. Insert data into the `vessel_positions_raw` table
3. Refresh materialized views for optimized queries
4. Provide progress updates and statistics

### Option B: Process Single File

```bash
# Process a specific date's CSV file
python pipeline/ais_pipeline.py insert 2024-01-15

# This will process only: AIS_2024_01_15_downsampled.csv
```

---

## Step 4: Monitor and Verify

### Monitor Processing

The pipeline provides real-time feedback:

```bash
# Example output:
Processing date: 2024-01-01
Reading file: AIS_2024_01_01_downsampled.csv
Found 50,000 records
Inserting into database...
Successfully inserted 50,000 records
Refreshing materialized views...
Complete: 2024-01-01
```

### Verify Database Content

```bash
# Connect to PostgreSQL and check data
psql -U postgres -d postgres

# Check number of records loaded
SELECT COUNT(*) FROM vessel_positions_raw;

# Check date range of loaded data
SELECT MIN(datetime_utc), MAX(datetime_utc) FROM vessel_positions_raw;

# Check vessel types available
SELECT vessel_type, COUNT(*) FROM vessel_positions_raw GROUP BY vessel_type ORDER BY COUNT(*) DESC;
```

---


## Troubleshooting

### File Issues

**Problem**: File not found
- Check file path: `app/static/files/ais_raw/01-downsampled/`
- Verify filename format: `AIS_YYYY_MM_DD_downsampled.csv`
- Check file permissions

**Problem**: CSV parsing errors
- Verify CSV format and column headers
- Check for special characters or encoding issues
- Ensure consistent date format (YYYY-MM-DD HH:MM:SS)

**Problem**: Empty or malformed files
- Check file size (should be > 0 bytes)
- Open file in text editor to verify content
- Check for proper CSV structure

### Database Issues

**Problem**: Database connection failed
- Verify PostgreSQL is running
- Check credentials in `.env` file
- Test connection: `psql -U postgres -d postgres`

**Problem**: Duplicate key errors
- Data might already exist in database
- Check for duplicate MMSI + timestamp combinations
- Consider clearing existing data first

**Problem**: Out of memory during insert
- Process smaller files or date ranges
- Increase PostgreSQL memory settings
- Close other applications

### Performance Issues

**Problem**: Very slow processing
- Check database indexes exist
- Verify sufficient disk space
- Consider processing smaller batches

**Problem**: High memory usage
- Process one file at a time using `insert` command
- Reduce file sizes if possible
- Restart the pipeline if memory leaks occur

---

## Data Management

### Clear Existing Data

```sql
-- Remove all data (careful!)
TRUNCATE TABLE vessel_positions_raw;

-- Remove data for specific date range
DELETE FROM vessel_positions_raw 
WHERE datetime_utc BETWEEN '2024-01-01' AND '2024-01-31 23:59:59';

-- Refresh materialized views after deletion
REFRESH MATERIALIZED VIEW daily_counts;
```

### Backup Data

```bash
# Create database backup
pg_dump -U postgres -d postgres -t vessel_positions_raw > vessel_data_backup.sql

# Restore from backup
psql -U postgres -d postgres < vessel_data_backup.sql
```

---

## Next Steps

After successful completion:

1. **Test the web interface** to verify data visualization
2. **Run data quality checks** using the SQL queries above
3. **Create database backups** for future use and failure management
4. **Clean up temporary files** to free disk space
5. **Explore Jupyter notebooks** for analysis

Return to the main [README.md](README.md) to continue with environment configuration and running the application.

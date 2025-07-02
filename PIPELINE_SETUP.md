# Full Pipeline Setup - Download, Process & Load

This guide covers the complete pipeline from downloading raw AIS data from NOAA to loading processed data into PostgreSQL.

## Overview

This option involves:
1. **Download**: Raw AIS data from NOAA servers (ZIP files, several GB each)
2. **Extract & Process**: Unzip files and downsample the data 
3. **Load**: Insert processed data into PostgreSQL database

**Time Requirements:**
- Download: ~3-6 minutes per file (depending on connection speed)
- Processing: ~3 minutes per file (per 1 day of data)
- Loading in DB: ~2 minutes per file
- Total: Several hours to complete

**Disk Space Requirements:**
- Raw files: ~700-900 MB per day
- Processed files: ~7MB-9MB per day
- Database: ~5 GB for a year of data

---

## Step 1: Download Raw AIS Data

### Configure Download Parameters

Edit `pipeline/download_files.py` to set your desired date range:

```python
# Download configuration
BASE_URL = "https://coast.noaa.gov/htdata/CMSP/AISDataHandler/2024/"
START_DATE = date(2024, 1, 1)     # Start date for download range
END_DATE = date(2024, 1, 31)      # End date for download range
DOWNLOAD_DIR = "./ais_raw"        # Directory to save downloaded files

# Dates to skip (useful for avoiding re-downloads or problematic dates)
OMIT_DATES = {
    date(2024, 1, 15)  # Example: skip this specific date if problematic
}
```

### Run the Download

```bash
# Make sure you're in the project root directory
cd unipi-ds-charikiopoulos-thesis

# Make sure your virtual environment is activated
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# Download AIS data files from NOAA
python pipeline/download_files.py
```

**Download Features:**
- **Automatic skip**: Won't re-download files that already exist
- **Date range control**: Specify exact date ranges for download
- **Selective omission**: Skip specific dates using OMIT_DATES
- **Error handling**: Gracefully handles network errors and missing files
- **Progress tracking**: Shows download progress and status

**Important Notes:**
- Downloaded files are in ZIP format
- Files are large - ensure sufficient disk space
- Download speed depends on your internet connection
- The NOAA server may have rate limits or temporary availability issues

---

## Step 2: Configure and Run Processing Pipeline

### Configure Processing Pipeline

Edit `pipeline/ais_pipeline.py` to set processing parameters:

```python
# Processing configuration
START_DATE = date(2024, 1, 1)     # Should match download range
END_DATE = date(2024, 1, 31)      # Should match download range
DOWNLOAD_DIR = "./ais_raw"        # Directory with ZIP files
```

### Run the Processing Pipeline

```bash
# Process and downsample the raw data files
python pipeline/ais_pipeline.py
```

The pipeline will automatically:
1. **Extract ZIP files** as needed (no manual extraction required)
2. **Read raw CSV files** from the extracted archives
3. **Downsample data** using time and distance thresholds to reduce size
4. **Save processed files** as downsampled CSV files
5. **Load data into PostgreSQL** automatically
6. **Refresh materialized views** for optimized queries

**Processing Features:**
- **Automatic ZIP extraction**: Pipeline handles ZIP files automatically
- **Time-based downsampling**: One position per vessel per hour
- **Distance-based filtering**: Only keep positions that are 300m+ apart
- **Batch processing**: Handles multiple days of data efficiently
- **Database integration**: Automatically loads processed data
- **Error handling**: Skips problematic files and continues processing

---

## Step 3: Monitor Progress

### Check Processing Status

The pipeline provides detailed progress information:

```bash
# Monitor the pipeline output for:
# - Files being processed
# - Number of records processed per file
# - Database insertion status
# - Any errors or warnings
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

### Download Issues

**Problem**: Download fails or stops
- Check internet connection
- Verify NOAA server availability
- Check disk space
- Try downloading smaller date ranges

**Problem**: Some files missing
- Check OMIT_DATES configuration
- Some dates may not have data available on NOAA servers
- Check the NOAA website for data availability

### Processing Issues

**Problem**: Processing is very slow
- Reduce the date range
- Ensure sufficient RAM (8GB+ recommended)
- Check disk space for temporary files

**Problem**: Database insertion fails
- Verify PostgreSQL is running
- Check database credentials in `.env`
- Ensure database schema is properly set up

**Problem**: Out of memory errors
- Process smaller date ranges
- Increase virtual memory/swap space
- Close other applications

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

### Storage Management

**Clean up raw files** after successful processing:
```bash
# Remove raw ZIP files (optional, after successful processing)
rm ais_raw/*.zip

# Remove extracted CSV files (optional, after successful processing)  
rm ais_raw/AIS_2024_*.csv
```

**Keep only essential files:**
- Downsampled CSV files (for reprocessing if needed)
- Database dump (for backup/sharing)

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

## Alternative: Partial Processing

If the full pipeline is too resource-intensive, you can process data in smaller chunks:

### Process One Day at a Time

```bash
# Download and process just one day
# 1. Edit download_files.py to set START_DATE = END_DATE = your target date
# 2. Run download
python pipeline/download_files.py

# 3. Process single file (pipeline will auto-extract ZIP)
python pipeline/ais_pipeline.py insert 2024-01-15
```

### Process Weekly Batches

```bash
# Process one week at a time
# Edit dates in download_files.py and ais_pipeline.py
# Week 1: 2024-01-01 to 2024-01-07
# Week 2: 2024-01-08 to 2024-01-14
# etc.
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

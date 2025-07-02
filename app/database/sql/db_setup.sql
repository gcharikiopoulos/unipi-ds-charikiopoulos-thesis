
-- Main SQL setup script for the AIS vessel positions database
-- The following script creates the raw data table with appropriate partitions and indexes
CREATE TABLE vessel_positions_raw (
    mmsi BIGINT,
    datetime_utc TIMESTAMP NOT NULL,
    day DATE NOT NULL,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    sog REAL,
    cog REAL,
    heading REAL,
    vessel_name VARCHAR(64),
    callsign VARCHAR(12),
    vessel_type REAL,
    status REAL,
    length REAL,
    width REAL,
    draft REAL,
    cargo REAL,
    transceiver_class CHAR(1)
) PARTITION BY RANGE (day);
CREATE INDEX idx_mmsi ON vessel_positions_raw (mmsi);
CREATE INDEX idx_datetime ON vessel_positions_raw (datetime_utc);
CREATE INDEX idx_mmsi_datetime ON vessel_positions_raw (mmsi, datetime_utc);
ANALYZE vessel_positions_raw; -- Analyze Table for Query Planner Optimization


-- This script creates a materialized view for daily counts of vessel positions
-- It aggregates the number of positions per vessel (mmsi) for each day
CREATE MATERIALIZED VIEW daily_counts AS
SELECT mmsi, DATE(datetime_utc) AS day, COUNT(*) AS pos_count
FROM vessel_positions_raw
GROUP BY mmsi, DATE(datetime_utc);
--
REFRESH MATERIALIZED VIEW daily_counts;


-- This script creates a materialized view for monthly counts of vessel positions
-- It aggregates the number of positions per vessel (mmsi) for each month
CREATE MATERIALIZED VIEW monthly_counts AS
SELECT mmsi, DATE_TRUNC('month', datetime_utc) AS month, COUNT(*) AS pos_count
FROM vessel_positions_raw
GROUP BY mmsi, DATE_TRUNC('month', datetime_utc);
--
REFRESH MATERIALIZED VIEW monthly_counts;


-- This script creates a materialized view that counts the number of positions per vessel (mmsi)
-- It aggregates the total number of positions for each vessel across the entire dataset
CREATE MATERIALIZED VIEW positions_by_mmsi AS
SELECT
  mmsi,
  COUNT(*) AS position_count
FROM vessel_positions_raw
GROUP BY mmsi;
--
REFRESH MATERIALIZED VIEW positions_by_mmsi;


-- This script creates a materialized view for vessel trajectories in the Gulf of Mexico for 2024
-- It filters vessels that have more than 300 positions, at least one position per month,
-- and less than 50% of positions with average speed below 0.5 knots
-- The view includes UTM coordinates for better spatial analysis
-- Note: UTM zones 15N and 16N are used for the Gulf of Mexico region
CREATE MATERIALIZED VIEW vessel_trajectories_gulf_2024 AS
WITH qualified_mmsi AS (
    SELECT mmsi
    FROM vessel_positions_raw
    WHERE 
        lat BETWEEN 18.0 AND 31.0
        AND lon BETWEEN -98.0 AND -81.0
    GROUP BY mmsi
    HAVING COUNT(*) >= 300 -- more than 300 positions
       AND COUNT(DISTINCT DATE_TRUNC('month', datetime_utc)) = 12 -- has positions every month during 2024
       AND SUM(CASE WHEN sog < 0.5 THEN 1 ELSE 0 END)::float / COUNT(*) < 0.5 -- not too many positions ave speed below 0.5
)
SELECT 
    v.mmsi,
    v.datetime_utc,
    v.lat,
    v.lon,
    v.sog,
    v.vessel_type,
    CASE
	    WHEN v.lon BETWEEN -98 AND -90 THEN
	        ST_X(ST_Transform(ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326), 32615))
	    WHEN v.lon BETWEEN -90 AND -81 THEN
	        ST_X(ST_Transform(ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326), 32616))
	    ELSE NULL
	END AS utm_x,
	CASE
	    WHEN v.lon BETWEEN -98 AND -90 THEN
	        ST_Y(ST_Transform(ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326), 32615))
	    WHEN v.lon BETWEEN -90 AND -81 THEN
	        ST_Y(ST_Transform(ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326), 32616))
	    ELSE NULL
	END AS utm_y
FROM vessel_positions_raw v
where
	v.mmsi IN (SELECT mmsi FROM qualified_mmsi)
	AND v.lat BETWEEN 18.0 AND 31.0
    AND v.lon BETWEEN -98.0 AND -81.0;
--
CREATE INDEX ON vessel_trajectories_gulf_2024 (mmsi, datetime_utc);
CREATE INDEX ON vessel_trajectories_gulf_2024 (lat, lon);
CREATE INDEX ON vessel_trajectories_gulf_2024 (vessel_type);
REFRESH MATERIALIZED VIEW vessel_trajectories_gulf_2024;
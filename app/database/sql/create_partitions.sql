-- This script creates partitions for the vessel_positions_raw table
-- Each partition corresponds to a single day of data
-- The partitions are created for the year 2024, starting from January 1st
-- Note: Ensure that the parent table vessel_positions_raw is created before running this script

CREATE TABLE vessel_positions_raw_2024_01_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-01') TO ('2024-01-02');

CREATE TABLE vessel_positions_raw_2024_01_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-02') TO ('2024-01-03');

CREATE TABLE vessel_positions_raw_2024_01_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-03') TO ('2024-01-04');

CREATE TABLE vessel_positions_raw_2024_01_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-04') TO ('2024-01-05');

CREATE TABLE vessel_positions_raw_2024_01_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-05') TO ('2024-01-06');

CREATE TABLE vessel_positions_raw_2024_01_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-06') TO ('2024-01-07');

CREATE TABLE vessel_positions_raw_2024_01_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-07') TO ('2024-01-08');

CREATE TABLE vessel_positions_raw_2024_01_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-08') TO ('2024-01-09');

CREATE TABLE vessel_positions_raw_2024_01_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-09') TO ('2024-01-10');

CREATE TABLE vessel_positions_raw_2024_01_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-10') TO ('2024-01-11');

CREATE TABLE vessel_positions_raw_2024_01_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-11') TO ('2024-01-12');

CREATE TABLE vessel_positions_raw_2024_01_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-12') TO ('2024-01-13');

CREATE TABLE vessel_positions_raw_2024_01_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-13') TO ('2024-01-14');

CREATE TABLE vessel_positions_raw_2024_01_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-14') TO ('2024-01-15');

CREATE TABLE vessel_positions_raw_2024_01_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-15') TO ('2024-01-16');

CREATE TABLE vessel_positions_raw_2024_01_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-16') TO ('2024-01-17');

CREATE TABLE vessel_positions_raw_2024_01_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-17') TO ('2024-01-18');

CREATE TABLE vessel_positions_raw_2024_01_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-18') TO ('2024-01-19');

CREATE TABLE vessel_positions_raw_2024_01_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-19') TO ('2024-01-20');

CREATE TABLE vessel_positions_raw_2024_01_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-20') TO ('2024-01-21');

CREATE TABLE vessel_positions_raw_2024_01_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-21') TO ('2024-01-22');

CREATE TABLE vessel_positions_raw_2024_01_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-22') TO ('2024-01-23');

CREATE TABLE vessel_positions_raw_2024_01_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-23') TO ('2024-01-24');

CREATE TABLE vessel_positions_raw_2024_01_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-24') TO ('2024-01-25');

CREATE TABLE vessel_positions_raw_2024_01_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-25') TO ('2024-01-26');

CREATE TABLE vessel_positions_raw_2024_01_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-26') TO ('2024-01-27');

CREATE TABLE vessel_positions_raw_2024_01_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-27') TO ('2024-01-28');

CREATE TABLE vessel_positions_raw_2024_01_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-28') TO ('2024-01-29');

CREATE TABLE vessel_positions_raw_2024_01_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-29') TO ('2024-01-30');

CREATE TABLE vessel_positions_raw_2024_01_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-30') TO ('2024-01-31');

CREATE TABLE vessel_positions_raw_2024_01_31
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-01-31') TO ('2024-02-01');

CREATE TABLE vessel_positions_raw_2024_02_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-01') TO ('2024-02-02');

CREATE TABLE vessel_positions_raw_2024_02_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-02') TO ('2024-02-03');

CREATE TABLE vessel_positions_raw_2024_02_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-03') TO ('2024-02-04');

CREATE TABLE vessel_positions_raw_2024_02_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-04') TO ('2024-02-05');

CREATE TABLE vessel_positions_raw_2024_02_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-05') TO ('2024-02-06');

CREATE TABLE vessel_positions_raw_2024_02_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-06') TO ('2024-02-07');

CREATE TABLE vessel_positions_raw_2024_02_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-07') TO ('2024-02-08');

CREATE TABLE vessel_positions_raw_2024_02_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-08') TO ('2024-02-09');

CREATE TABLE vessel_positions_raw_2024_02_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-09') TO ('2024-02-10');

CREATE TABLE vessel_positions_raw_2024_02_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-10') TO ('2024-02-11');

CREATE TABLE vessel_positions_raw_2024_02_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-11') TO ('2024-02-12');

CREATE TABLE vessel_positions_raw_2024_02_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-12') TO ('2024-02-13');

CREATE TABLE vessel_positions_raw_2024_02_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-13') TO ('2024-02-14');

CREATE TABLE vessel_positions_raw_2024_02_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-14') TO ('2024-02-15');

CREATE TABLE vessel_positions_raw_2024_02_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-15') TO ('2024-02-16');

CREATE TABLE vessel_positions_raw_2024_02_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-16') TO ('2024-02-17');

CREATE TABLE vessel_positions_raw_2024_02_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-17') TO ('2024-02-18');

CREATE TABLE vessel_positions_raw_2024_02_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-18') TO ('2024-02-19');

CREATE TABLE vessel_positions_raw_2024_02_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-19') TO ('2024-02-20');

CREATE TABLE vessel_positions_raw_2024_02_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-20') TO ('2024-02-21');

CREATE TABLE vessel_positions_raw_2024_02_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-21') TO ('2024-02-22');

CREATE TABLE vessel_positions_raw_2024_02_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-22') TO ('2024-02-23');

CREATE TABLE vessel_positions_raw_2024_02_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-23') TO ('2024-02-24');

CREATE TABLE vessel_positions_raw_2024_02_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-24') TO ('2024-02-25');

CREATE TABLE vessel_positions_raw_2024_02_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-25') TO ('2024-02-26');

CREATE TABLE vessel_positions_raw_2024_02_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-26') TO ('2024-02-27');

CREATE TABLE vessel_positions_raw_2024_02_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-27') TO ('2024-02-28');

CREATE TABLE vessel_positions_raw_2024_02_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-28') TO ('2024-02-29');

CREATE TABLE vessel_positions_raw_2024_02_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-02-29') TO ('2024-03-01');

CREATE TABLE vessel_positions_raw_2024_03_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-01') TO ('2024-03-02');

CREATE TABLE vessel_positions_raw_2024_03_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-02') TO ('2024-03-03');

CREATE TABLE vessel_positions_raw_2024_03_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-03') TO ('2024-03-04');

CREATE TABLE vessel_positions_raw_2024_03_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-04') TO ('2024-03-05');

CREATE TABLE vessel_positions_raw_2024_03_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-05') TO ('2024-03-06');

CREATE TABLE vessel_positions_raw_2024_03_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-06') TO ('2024-03-07');

CREATE TABLE vessel_positions_raw_2024_03_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-07') TO ('2024-03-08');

CREATE TABLE vessel_positions_raw_2024_03_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-08') TO ('2024-03-09');

CREATE TABLE vessel_positions_raw_2024_03_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-09') TO ('2024-03-10');

CREATE TABLE vessel_positions_raw_2024_03_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-10') TO ('2024-03-11');

CREATE TABLE vessel_positions_raw_2024_03_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-11') TO ('2024-03-12');

CREATE TABLE vessel_positions_raw_2024_03_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-12') TO ('2024-03-13');

CREATE TABLE vessel_positions_raw_2024_03_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-13') TO ('2024-03-14');

CREATE TABLE vessel_positions_raw_2024_03_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-14') TO ('2024-03-15');

CREATE TABLE vessel_positions_raw_2024_03_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-15') TO ('2024-03-16');

CREATE TABLE vessel_positions_raw_2024_03_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-16') TO ('2024-03-17');

CREATE TABLE vessel_positions_raw_2024_03_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-17') TO ('2024-03-18');

CREATE TABLE vessel_positions_raw_2024_03_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-18') TO ('2024-03-19');

CREATE TABLE vessel_positions_raw_2024_03_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-19') TO ('2024-03-20');

CREATE TABLE vessel_positions_raw_2024_03_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-20') TO ('2024-03-21');

CREATE TABLE vessel_positions_raw_2024_03_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-21') TO ('2024-03-22');

CREATE TABLE vessel_positions_raw_2024_03_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-22') TO ('2024-03-23');

CREATE TABLE vessel_positions_raw_2024_03_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-23') TO ('2024-03-24');

CREATE TABLE vessel_positions_raw_2024_03_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-24') TO ('2024-03-25');

CREATE TABLE vessel_positions_raw_2024_03_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-25') TO ('2024-03-26');

CREATE TABLE vessel_positions_raw_2024_03_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-26') TO ('2024-03-27');

CREATE TABLE vessel_positions_raw_2024_03_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-27') TO ('2024-03-28');

CREATE TABLE vessel_positions_raw_2024_03_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-28') TO ('2024-03-29');

CREATE TABLE vessel_positions_raw_2024_03_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-29') TO ('2024-03-30');

CREATE TABLE vessel_positions_raw_2024_03_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-30') TO ('2024-03-31');

CREATE TABLE vessel_positions_raw_2024_03_31
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-03-31') TO ('2024-04-01');

CREATE TABLE vessel_positions_raw_2024_04_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-01') TO ('2024-04-02');

CREATE TABLE vessel_positions_raw_2024_04_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-02') TO ('2024-04-03');

CREATE TABLE vessel_positions_raw_2024_04_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-03') TO ('2024-04-04');

CREATE TABLE vessel_positions_raw_2024_04_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-04') TO ('2024-04-05');

CREATE TABLE vessel_positions_raw_2024_04_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-05') TO ('2024-04-06');

CREATE TABLE vessel_positions_raw_2024_04_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-06') TO ('2024-04-07');

CREATE TABLE vessel_positions_raw_2024_04_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-07') TO ('2024-04-08');

CREATE TABLE vessel_positions_raw_2024_04_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-08') TO ('2024-04-09');

CREATE TABLE vessel_positions_raw_2024_04_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-09') TO ('2024-04-10');

CREATE TABLE vessel_positions_raw_2024_04_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-10') TO ('2024-04-11');

CREATE TABLE vessel_positions_raw_2024_04_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-11') TO ('2024-04-12');

CREATE TABLE vessel_positions_raw_2024_04_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-12') TO ('2024-04-13');

CREATE TABLE vessel_positions_raw_2024_04_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-13') TO ('2024-04-14');

CREATE TABLE vessel_positions_raw_2024_04_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-14') TO ('2024-04-15');

CREATE TABLE vessel_positions_raw_2024_04_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-15') TO ('2024-04-16');

CREATE TABLE vessel_positions_raw_2024_04_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-16') TO ('2024-04-17');

CREATE TABLE vessel_positions_raw_2024_04_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-17') TO ('2024-04-18');

CREATE TABLE vessel_positions_raw_2024_04_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-18') TO ('2024-04-19');

CREATE TABLE vessel_positions_raw_2024_04_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-19') TO ('2024-04-20');

CREATE TABLE vessel_positions_raw_2024_04_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-20') TO ('2024-04-21');

CREATE TABLE vessel_positions_raw_2024_04_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-21') TO ('2024-04-22');

CREATE TABLE vessel_positions_raw_2024_04_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-22') TO ('2024-04-23');

CREATE TABLE vessel_positions_raw_2024_04_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-23') TO ('2024-04-24');

CREATE TABLE vessel_positions_raw_2024_04_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-24') TO ('2024-04-25');

CREATE TABLE vessel_positions_raw_2024_04_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-25') TO ('2024-04-26');

CREATE TABLE vessel_positions_raw_2024_04_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-26') TO ('2024-04-27');

CREATE TABLE vessel_positions_raw_2024_04_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-27') TO ('2024-04-28');

CREATE TABLE vessel_positions_raw_2024_04_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-28') TO ('2024-04-29');

CREATE TABLE vessel_positions_raw_2024_04_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-29') TO ('2024-04-30');

CREATE TABLE vessel_positions_raw_2024_04_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-04-30') TO ('2024-05-01');

CREATE TABLE vessel_positions_raw_2024_05_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-01') TO ('2024-05-02');

CREATE TABLE vessel_positions_raw_2024_05_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-02') TO ('2024-05-03');

CREATE TABLE vessel_positions_raw_2024_05_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-03') TO ('2024-05-04');

CREATE TABLE vessel_positions_raw_2024_05_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-04') TO ('2024-05-05');

CREATE TABLE vessel_positions_raw_2024_05_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-05') TO ('2024-05-06');

CREATE TABLE vessel_positions_raw_2024_05_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-06') TO ('2024-05-07');

CREATE TABLE vessel_positions_raw_2024_05_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-07') TO ('2024-05-08');

CREATE TABLE vessel_positions_raw_2024_05_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-08') TO ('2024-05-09');

CREATE TABLE vessel_positions_raw_2024_05_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-09') TO ('2024-05-10');

CREATE TABLE vessel_positions_raw_2024_05_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-10') TO ('2024-05-11');

CREATE TABLE vessel_positions_raw_2024_05_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-11') TO ('2024-05-12');

CREATE TABLE vessel_positions_raw_2024_05_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-12') TO ('2024-05-13');

CREATE TABLE vessel_positions_raw_2024_05_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-13') TO ('2024-05-14');

CREATE TABLE vessel_positions_raw_2024_05_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-14') TO ('2024-05-15');

CREATE TABLE vessel_positions_raw_2024_05_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-15') TO ('2024-05-16');

CREATE TABLE vessel_positions_raw_2024_05_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-16') TO ('2024-05-17');

CREATE TABLE vessel_positions_raw_2024_05_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-17') TO ('2024-05-18');

CREATE TABLE vessel_positions_raw_2024_05_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-18') TO ('2024-05-19');

CREATE TABLE vessel_positions_raw_2024_05_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-19') TO ('2024-05-20');

CREATE TABLE vessel_positions_raw_2024_05_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-20') TO ('2024-05-21');

CREATE TABLE vessel_positions_raw_2024_05_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-21') TO ('2024-05-22');

CREATE TABLE vessel_positions_raw_2024_05_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-22') TO ('2024-05-23');

CREATE TABLE vessel_positions_raw_2024_05_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-23') TO ('2024-05-24');

CREATE TABLE vessel_positions_raw_2024_05_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-24') TO ('2024-05-25');

CREATE TABLE vessel_positions_raw_2024_05_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-25') TO ('2024-05-26');

CREATE TABLE vessel_positions_raw_2024_05_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-26') TO ('2024-05-27');

CREATE TABLE vessel_positions_raw_2024_05_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-27') TO ('2024-05-28');

CREATE TABLE vessel_positions_raw_2024_05_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-28') TO ('2024-05-29');

CREATE TABLE vessel_positions_raw_2024_05_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-29') TO ('2024-05-30');

CREATE TABLE vessel_positions_raw_2024_05_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-30') TO ('2024-05-31');

CREATE TABLE vessel_positions_raw_2024_05_31
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-05-31') TO ('2024-06-01');

CREATE TABLE vessel_positions_raw_2024_06_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-01') TO ('2024-06-02');

CREATE TABLE vessel_positions_raw_2024_06_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-02') TO ('2024-06-03');

CREATE TABLE vessel_positions_raw_2024_06_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-03') TO ('2024-06-04');

CREATE TABLE vessel_positions_raw_2024_06_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-04') TO ('2024-06-05');

CREATE TABLE vessel_positions_raw_2024_06_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-05') TO ('2024-06-06');

CREATE TABLE vessel_positions_raw_2024_06_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-06') TO ('2024-06-07');

CREATE TABLE vessel_positions_raw_2024_06_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-07') TO ('2024-06-08');

CREATE TABLE vessel_positions_raw_2024_06_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-08') TO ('2024-06-09');

CREATE TABLE vessel_positions_raw_2024_06_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-09') TO ('2024-06-10');

CREATE TABLE vessel_positions_raw_2024_06_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-10') TO ('2024-06-11');

CREATE TABLE vessel_positions_raw_2024_06_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-11') TO ('2024-06-12');

CREATE TABLE vessel_positions_raw_2024_06_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-12') TO ('2024-06-13');

CREATE TABLE vessel_positions_raw_2024_06_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-13') TO ('2024-06-14');

CREATE TABLE vessel_positions_raw_2024_06_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-14') TO ('2024-06-15');

CREATE TABLE vessel_positions_raw_2024_06_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-15') TO ('2024-06-16');

CREATE TABLE vessel_positions_raw_2024_06_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-16') TO ('2024-06-17');

CREATE TABLE vessel_positions_raw_2024_06_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-17') TO ('2024-06-18');

CREATE TABLE vessel_positions_raw_2024_06_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-18') TO ('2024-06-19');

CREATE TABLE vessel_positions_raw_2024_06_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-19') TO ('2024-06-20');

CREATE TABLE vessel_positions_raw_2024_06_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-20') TO ('2024-06-21');

CREATE TABLE vessel_positions_raw_2024_06_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-21') TO ('2024-06-22');

CREATE TABLE vessel_positions_raw_2024_06_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-22') TO ('2024-06-23');

CREATE TABLE vessel_positions_raw_2024_06_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-23') TO ('2024-06-24');

CREATE TABLE vessel_positions_raw_2024_06_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-24') TO ('2024-06-25');

CREATE TABLE vessel_positions_raw_2024_06_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-25') TO ('2024-06-26');

CREATE TABLE vessel_positions_raw_2024_06_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-26') TO ('2024-06-27');

CREATE TABLE vessel_positions_raw_2024_06_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-27') TO ('2024-06-28');

CREATE TABLE vessel_positions_raw_2024_06_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-28') TO ('2024-06-29');

CREATE TABLE vessel_positions_raw_2024_06_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-29') TO ('2024-06-30');

CREATE TABLE vessel_positions_raw_2024_06_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-06-30') TO ('2024-07-01');

CREATE TABLE vessel_positions_raw_2024_07_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-01') TO ('2024-07-02');

CREATE TABLE vessel_positions_raw_2024_07_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-02') TO ('2024-07-03');

CREATE TABLE vessel_positions_raw_2024_07_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-03') TO ('2024-07-04');

CREATE TABLE vessel_positions_raw_2024_07_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-04') TO ('2024-07-05');

CREATE TABLE vessel_positions_raw_2024_07_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-05') TO ('2024-07-06');

CREATE TABLE vessel_positions_raw_2024_07_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-06') TO ('2024-07-07');

CREATE TABLE vessel_positions_raw_2024_07_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-07') TO ('2024-07-08');

CREATE TABLE vessel_positions_raw_2024_07_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-08') TO ('2024-07-09');

CREATE TABLE vessel_positions_raw_2024_07_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-09') TO ('2024-07-10');

CREATE TABLE vessel_positions_raw_2024_07_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-10') TO ('2024-07-11');

CREATE TABLE vessel_positions_raw_2024_07_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-11') TO ('2024-07-12');

CREATE TABLE vessel_positions_raw_2024_07_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-12') TO ('2024-07-13');

CREATE TABLE vessel_positions_raw_2024_07_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-13') TO ('2024-07-14');

CREATE TABLE vessel_positions_raw_2024_07_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-14') TO ('2024-07-15');

CREATE TABLE vessel_positions_raw_2024_07_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-15') TO ('2024-07-16');

CREATE TABLE vessel_positions_raw_2024_07_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-16') TO ('2024-07-17');

CREATE TABLE vessel_positions_raw_2024_07_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-17') TO ('2024-07-18');

CREATE TABLE vessel_positions_raw_2024_07_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-18') TO ('2024-07-19');

CREATE TABLE vessel_positions_raw_2024_07_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-19') TO ('2024-07-20');

CREATE TABLE vessel_positions_raw_2024_07_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-20') TO ('2024-07-21');

CREATE TABLE vessel_positions_raw_2024_07_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-21') TO ('2024-07-22');

CREATE TABLE vessel_positions_raw_2024_07_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-22') TO ('2024-07-23');

CREATE TABLE vessel_positions_raw_2024_07_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-23') TO ('2024-07-24');

CREATE TABLE vessel_positions_raw_2024_07_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-24') TO ('2024-07-25');

CREATE TABLE vessel_positions_raw_2024_07_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-25') TO ('2024-07-26');

CREATE TABLE vessel_positions_raw_2024_07_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-26') TO ('2024-07-27');

CREATE TABLE vessel_positions_raw_2024_07_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-27') TO ('2024-07-28');

CREATE TABLE vessel_positions_raw_2024_07_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-28') TO ('2024-07-29');

CREATE TABLE vessel_positions_raw_2024_07_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-29') TO ('2024-07-30');

CREATE TABLE vessel_positions_raw_2024_07_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-30') TO ('2024-07-31');

CREATE TABLE vessel_positions_raw_2024_07_31
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-07-31') TO ('2024-08-01');

CREATE TABLE vessel_positions_raw_2024_08_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-01') TO ('2024-08-02');

CREATE TABLE vessel_positions_raw_2024_08_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-02') TO ('2024-08-03');

CREATE TABLE vessel_positions_raw_2024_08_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-03') TO ('2024-08-04');

CREATE TABLE vessel_positions_raw_2024_08_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-04') TO ('2024-08-05');

CREATE TABLE vessel_positions_raw_2024_08_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-05') TO ('2024-08-06');

CREATE TABLE vessel_positions_raw_2024_08_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-06') TO ('2024-08-07');

CREATE TABLE vessel_positions_raw_2024_08_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-07') TO ('2024-08-08');

CREATE TABLE vessel_positions_raw_2024_08_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-08') TO ('2024-08-09');

CREATE TABLE vessel_positions_raw_2024_08_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-09') TO ('2024-08-10');

CREATE TABLE vessel_positions_raw_2024_08_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-10') TO ('2024-08-11');

CREATE TABLE vessel_positions_raw_2024_08_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-11') TO ('2024-08-12');

CREATE TABLE vessel_positions_raw_2024_08_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-12') TO ('2024-08-13');

CREATE TABLE vessel_positions_raw_2024_08_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-13') TO ('2024-08-14');

CREATE TABLE vessel_positions_raw_2024_08_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-14') TO ('2024-08-15');

CREATE TABLE vessel_positions_raw_2024_08_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-15') TO ('2024-08-16');

CREATE TABLE vessel_positions_raw_2024_08_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-16') TO ('2024-08-17');

CREATE TABLE vessel_positions_raw_2024_08_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-17') TO ('2024-08-18');

CREATE TABLE vessel_positions_raw_2024_08_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-18') TO ('2024-08-19');

CREATE TABLE vessel_positions_raw_2024_08_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-19') TO ('2024-08-20');

CREATE TABLE vessel_positions_raw_2024_08_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-20') TO ('2024-08-21');

CREATE TABLE vessel_positions_raw_2024_08_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-21') TO ('2024-08-22');

CREATE TABLE vessel_positions_raw_2024_08_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-22') TO ('2024-08-23');

CREATE TABLE vessel_positions_raw_2024_08_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-23') TO ('2024-08-24');

CREATE TABLE vessel_positions_raw_2024_08_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-24') TO ('2024-08-25');

CREATE TABLE vessel_positions_raw_2024_08_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-25') TO ('2024-08-26');

CREATE TABLE vessel_positions_raw_2024_08_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-26') TO ('2024-08-27');

CREATE TABLE vessel_positions_raw_2024_08_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-27') TO ('2024-08-28');

CREATE TABLE vessel_positions_raw_2024_08_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-28') TO ('2024-08-29');

CREATE TABLE vessel_positions_raw_2024_08_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-29') TO ('2024-08-30');

CREATE TABLE vessel_positions_raw_2024_08_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-30') TO ('2024-08-31');

CREATE TABLE vessel_positions_raw_2024_08_31
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-08-31') TO ('2024-09-01');

CREATE TABLE vessel_positions_raw_2024_09_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-01') TO ('2024-09-02');

CREATE TABLE vessel_positions_raw_2024_09_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-02') TO ('2024-09-03');

CREATE TABLE vessel_positions_raw_2024_09_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-03') TO ('2024-09-04');

CREATE TABLE vessel_positions_raw_2024_09_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-04') TO ('2024-09-05');

CREATE TABLE vessel_positions_raw_2024_09_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-05') TO ('2024-09-06');

CREATE TABLE vessel_positions_raw_2024_09_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-06') TO ('2024-09-07');

CREATE TABLE vessel_positions_raw_2024_09_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-07') TO ('2024-09-08');

CREATE TABLE vessel_positions_raw_2024_09_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-08') TO ('2024-09-09');

CREATE TABLE vessel_positions_raw_2024_09_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-09') TO ('2024-09-10');

CREATE TABLE vessel_positions_raw_2024_09_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-10') TO ('2024-09-11');

CREATE TABLE vessel_positions_raw_2024_09_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-11') TO ('2024-09-12');

CREATE TABLE vessel_positions_raw_2024_09_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-12') TO ('2024-09-13');

CREATE TABLE vessel_positions_raw_2024_09_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-13') TO ('2024-09-14');

CREATE TABLE vessel_positions_raw_2024_09_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-14') TO ('2024-09-15');

CREATE TABLE vessel_positions_raw_2024_09_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-15') TO ('2024-09-16');

CREATE TABLE vessel_positions_raw_2024_09_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-16') TO ('2024-09-17');

CREATE TABLE vessel_positions_raw_2024_09_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-17') TO ('2024-09-18');

CREATE TABLE vessel_positions_raw_2024_09_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-18') TO ('2024-09-19');

CREATE TABLE vessel_positions_raw_2024_09_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-19') TO ('2024-09-20');

CREATE TABLE vessel_positions_raw_2024_09_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-20') TO ('2024-09-21');

CREATE TABLE vessel_positions_raw_2024_09_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-21') TO ('2024-09-22');

CREATE TABLE vessel_positions_raw_2024_09_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-22') TO ('2024-09-23');

CREATE TABLE vessel_positions_raw_2024_09_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-23') TO ('2024-09-24');

CREATE TABLE vessel_positions_raw_2024_09_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-24') TO ('2024-09-25');

CREATE TABLE vessel_positions_raw_2024_09_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-25') TO ('2024-09-26');

CREATE TABLE vessel_positions_raw_2024_09_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-26') TO ('2024-09-27');

CREATE TABLE vessel_positions_raw_2024_09_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-27') TO ('2024-09-28');

CREATE TABLE vessel_positions_raw_2024_09_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-28') TO ('2024-09-29');

CREATE TABLE vessel_positions_raw_2024_09_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-29') TO ('2024-09-30');

CREATE TABLE vessel_positions_raw_2024_09_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-09-30') TO ('2024-10-01');

CREATE TABLE vessel_positions_raw_2024_10_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-01') TO ('2024-10-02');

CREATE TABLE vessel_positions_raw_2024_10_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-02') TO ('2024-10-03');

CREATE TABLE vessel_positions_raw_2024_10_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-03') TO ('2024-10-04');

CREATE TABLE vessel_positions_raw_2024_10_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-04') TO ('2024-10-05');

CREATE TABLE vessel_positions_raw_2024_10_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-05') TO ('2024-10-06');

CREATE TABLE vessel_positions_raw_2024_10_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-06') TO ('2024-10-07');

CREATE TABLE vessel_positions_raw_2024_10_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-07') TO ('2024-10-08');

CREATE TABLE vessel_positions_raw_2024_10_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-08') TO ('2024-10-09');

CREATE TABLE vessel_positions_raw_2024_10_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-09') TO ('2024-10-10');

CREATE TABLE vessel_positions_raw_2024_10_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-10') TO ('2024-10-11');

CREATE TABLE vessel_positions_raw_2024_10_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-11') TO ('2024-10-12');

CREATE TABLE vessel_positions_raw_2024_10_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-12') TO ('2024-10-13');

CREATE TABLE vessel_positions_raw_2024_10_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-13') TO ('2024-10-14');

CREATE TABLE vessel_positions_raw_2024_10_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-14') TO ('2024-10-15');

CREATE TABLE vessel_positions_raw_2024_10_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-15') TO ('2024-10-16');

CREATE TABLE vessel_positions_raw_2024_10_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-16') TO ('2024-10-17');

CREATE TABLE vessel_positions_raw_2024_10_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-17') TO ('2024-10-18');

CREATE TABLE vessel_positions_raw_2024_10_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-18') TO ('2024-10-19');

CREATE TABLE vessel_positions_raw_2024_10_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-19') TO ('2024-10-20');

CREATE TABLE vessel_positions_raw_2024_10_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-20') TO ('2024-10-21');

CREATE TABLE vessel_positions_raw_2024_10_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-21') TO ('2024-10-22');

CREATE TABLE vessel_positions_raw_2024_10_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-22') TO ('2024-10-23');

CREATE TABLE vessel_positions_raw_2024_10_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-23') TO ('2024-10-24');

CREATE TABLE vessel_positions_raw_2024_10_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-24') TO ('2024-10-25');

CREATE TABLE vessel_positions_raw_2024_10_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-25') TO ('2024-10-26');

CREATE TABLE vessel_positions_raw_2024_10_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-26') TO ('2024-10-27');

CREATE TABLE vessel_positions_raw_2024_10_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-27') TO ('2024-10-28');

CREATE TABLE vessel_positions_raw_2024_10_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-28') TO ('2024-10-29');

CREATE TABLE vessel_positions_raw_2024_10_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-29') TO ('2024-10-30');

CREATE TABLE vessel_positions_raw_2024_10_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-30') TO ('2024-10-31');

CREATE TABLE vessel_positions_raw_2024_10_31
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-10-31') TO ('2024-11-01');

CREATE TABLE vessel_positions_raw_2024_11_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-01') TO ('2024-11-02');

CREATE TABLE vessel_positions_raw_2024_11_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-02') TO ('2024-11-03');

CREATE TABLE vessel_positions_raw_2024_11_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-03') TO ('2024-11-04');

CREATE TABLE vessel_positions_raw_2024_11_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-04') TO ('2024-11-05');

CREATE TABLE vessel_positions_raw_2024_11_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-05') TO ('2024-11-06');

CREATE TABLE vessel_positions_raw_2024_11_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-06') TO ('2024-11-07');

CREATE TABLE vessel_positions_raw_2024_11_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-07') TO ('2024-11-08');

CREATE TABLE vessel_positions_raw_2024_11_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-08') TO ('2024-11-09');

CREATE TABLE vessel_positions_raw_2024_11_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-09') TO ('2024-11-10');

CREATE TABLE vessel_positions_raw_2024_11_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-10') TO ('2024-11-11');

CREATE TABLE vessel_positions_raw_2024_11_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-11') TO ('2024-11-12');

CREATE TABLE vessel_positions_raw_2024_11_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-12') TO ('2024-11-13');

CREATE TABLE vessel_positions_raw_2024_11_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-13') TO ('2024-11-14');

CREATE TABLE vessel_positions_raw_2024_11_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-14') TO ('2024-11-15');

CREATE TABLE vessel_positions_raw_2024_11_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-15') TO ('2024-11-16');

CREATE TABLE vessel_positions_raw_2024_11_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-16') TO ('2024-11-17');

CREATE TABLE vessel_positions_raw_2024_11_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-17') TO ('2024-11-18');

CREATE TABLE vessel_positions_raw_2024_11_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-18') TO ('2024-11-19');

CREATE TABLE vessel_positions_raw_2024_11_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-19') TO ('2024-11-20');

CREATE TABLE vessel_positions_raw_2024_11_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-20') TO ('2024-11-21');

CREATE TABLE vessel_positions_raw_2024_11_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-21') TO ('2024-11-22');

CREATE TABLE vessel_positions_raw_2024_11_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-22') TO ('2024-11-23');

CREATE TABLE vessel_positions_raw_2024_11_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-23') TO ('2024-11-24');

CREATE TABLE vessel_positions_raw_2024_11_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-24') TO ('2024-11-25');

CREATE TABLE vessel_positions_raw_2024_11_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-25') TO ('2024-11-26');

CREATE TABLE vessel_positions_raw_2024_11_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-26') TO ('2024-11-27');

CREATE TABLE vessel_positions_raw_2024_11_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-27') TO ('2024-11-28');

CREATE TABLE vessel_positions_raw_2024_11_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-28') TO ('2024-11-29');

CREATE TABLE vessel_positions_raw_2024_11_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-29') TO ('2024-11-30');

CREATE TABLE vessel_positions_raw_2024_11_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-11-30') TO ('2024-12-01');

CREATE TABLE vessel_positions_raw_2024_12_01
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-01') TO ('2024-12-02');

CREATE TABLE vessel_positions_raw_2024_12_02
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-02') TO ('2024-12-03');

CREATE TABLE vessel_positions_raw_2024_12_03
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-03') TO ('2024-12-04');

CREATE TABLE vessel_positions_raw_2024_12_04
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-04') TO ('2024-12-05');

CREATE TABLE vessel_positions_raw_2024_12_05
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-05') TO ('2024-12-06');

CREATE TABLE vessel_positions_raw_2024_12_06
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-06') TO ('2024-12-07');

CREATE TABLE vessel_positions_raw_2024_12_07
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-07') TO ('2024-12-08');

CREATE TABLE vessel_positions_raw_2024_12_08
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-08') TO ('2024-12-09');

CREATE TABLE vessel_positions_raw_2024_12_09
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-09') TO ('2024-12-10');

CREATE TABLE vessel_positions_raw_2024_12_10
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-10') TO ('2024-12-11');

CREATE TABLE vessel_positions_raw_2024_12_11
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-11') TO ('2024-12-12');

CREATE TABLE vessel_positions_raw_2024_12_12
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-12') TO ('2024-12-13');

CREATE TABLE vessel_positions_raw_2024_12_13
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-13') TO ('2024-12-14');

CREATE TABLE vessel_positions_raw_2024_12_14
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-14') TO ('2024-12-15');

CREATE TABLE vessel_positions_raw_2024_12_15
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-15') TO ('2024-12-16');

CREATE TABLE vessel_positions_raw_2024_12_16
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-16') TO ('2024-12-17');

CREATE TABLE vessel_positions_raw_2024_12_17
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-17') TO ('2024-12-18');

CREATE TABLE vessel_positions_raw_2024_12_18
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-18') TO ('2024-12-19');

CREATE TABLE vessel_positions_raw_2024_12_19
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-19') TO ('2024-12-20');

CREATE TABLE vessel_positions_raw_2024_12_20
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-20') TO ('2024-12-21');

CREATE TABLE vessel_positions_raw_2024_12_21
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-21') TO ('2024-12-22');

CREATE TABLE vessel_positions_raw_2024_12_22
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-22') TO ('2024-12-23');

CREATE TABLE vessel_positions_raw_2024_12_23
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-23') TO ('2024-12-24');

CREATE TABLE vessel_positions_raw_2024_12_24
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-24') TO ('2024-12-25');

CREATE TABLE vessel_positions_raw_2024_12_25
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-25') TO ('2024-12-26');

CREATE TABLE vessel_positions_raw_2024_12_26
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-26') TO ('2024-12-27');

CREATE TABLE vessel_positions_raw_2024_12_27
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-27') TO ('2024-12-28');

CREATE TABLE vessel_positions_raw_2024_12_28
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-28') TO ('2024-12-29');

CREATE TABLE vessel_positions_raw_2024_12_29
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-29') TO ('2024-12-30');

CREATE TABLE vessel_positions_raw_2024_12_30
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-30') TO ('2024-12-31');

CREATE TABLE vessel_positions_raw_2024_12_31
PARTITION OF vessel_positions_raw
FOR VALUES FROM ('2024-12-31') TO ('2025-01-01');

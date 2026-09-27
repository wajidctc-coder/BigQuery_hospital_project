CREATE OR REPLACE TABLE `dbt-learn-509209.hospital_silver.silver_data` AS
SELECT DISTINCT
  TRIM(Patient_ID) AS patient_id,
  SAFE_CAST(Visit_Date AS DATE) AS visit_date,
  SAFE_CAST(Age AS INT64) AS age,
  TRIM(Gender) AS gender,
  TRIM(Disease) AS diagnosis,
  TRIM(Severity) AS patient_condition,
  TRIM(Admission_Type) AS admission_type,
  SAFE_CAST(Length_of_Stay AS INT64) AS length_of_stay,
  SAFE_CAST(Total_Beds_Available AS INT64) AS beds_available,
  SAFE_CAST(Beds_Occupied AS INT64) AS beds_occupied,
  SAFE_CAST(ICU_Beds_Available AS INT64) AS icu_beds_available,
  SAFE_CAST(ICU_Beds_Occupied AS INT64) AS icu_beds_occupied,
  SAFE_CAST(Oxygen_Units_Used AS INT64) AS oxygen_units_used,
  SAFE_CAST(Month AS INT64) AS month_no,
  TRIM(Season) AS season,
  TRIM(Department) AS dept,
  CASE
    WHEN LOWER(TRIM(Readmission_Within_30_Days)) IN ('yes','true','1') THEN TRUE
    WHEN LOWER(TRIM(Readmission_Within_30_Days)) IN ('no','false','0') THEN FALSE
    ELSE NULL
  END AS readmission_30d
FROM `dbt-learn-509209.hospital_bronze.bronze_data`
WHERE Patient_ID IS NOT NULL
  AND TRIM(Patient_ID) != '';
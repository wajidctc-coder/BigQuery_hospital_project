-- Gold 2: Disease & severity breakdown
CREATE OR REPLACE TABLE `dbt-learn-509209.hospital_gold.disease_summary` AS
SELECT
  diagnosis,
  patient_condition AS severity,
  dept,
  COUNT(*) AS patient_count,
  AVG(age) AS avg_age,
  AVG(length_of_stay) AS avg_los
FROM `dbt-learn-509209.hospital_silver.silver_data`
GROUP BY diagnosis, severity, dept
ORDER BY patient_count DESC;


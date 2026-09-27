CREATE OR REPLACE TABLE `dbt-learn-509209.hospital_gold.daily_operations` AS
SELECT
  visit_date,
  COUNT(*) AS total_visits,
  SUM(beds_occupied) AS beds_used,
  SUM(icu_beds_occupied) AS icu_used,
  SUM(oxygen_units_used) AS oxygen_used,
  AVG(length_of_stay) AS avg_los,
  SUM(CASE WHEN readmission_30d THEN 1 ELSE 0 END) AS readmissions
FROM `dbt-learn-509209.hospital_silver.silver_data`
GROUP BY visit_date
ORDER BY visit_date;
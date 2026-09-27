-- Gold 3: Seasonal department load
CREATE OR REPLACE TABLE `dbt-learn-509209.hospital_gold.seasonal_load` AS
SELECT
  season,
  dept,
  COUNT(*) AS visits,
  AVG(beds_occupied) AS avg_beds_used,
  AVG(icu_beds_occupied) AS avg_icu_used,
  AVG(oxygen_units_used) AS avg_oxygen
FROM `dbt-learn-509209.hospital_silver.silver_data`
GROUP BY season, dept
ORDER BY season, visits DESC;
# 🏥 Hospital Analytics — BigQuery Medallion Pipeline

An end-to-end hospital analytics project using **BigQuery medallion architecture** (Bronze → Silver → Gold) with **Power BI** as the visualization layer.

## 🏛️ Architecture

- **Bronze** (`hospital_bronze.bronze_data`) — raw ingested CSV data
- **Silver** (`hospital_silver.silver_data`) — cleaned, type-cast, deduplicated
- **Gold** (`hospital_gold.*`) — business-ready aggregations

## 📊 Gold Layer Tables

| Table | Description |
|-------|-------------|
| `daily_operations` | Daily visits, bed/ICU occupancy, oxygen usage |
| `disease_summary` | Disease + severity + department breakdown |
| `seasonal_load` | Seasonal department load analysis |

## 🛠️ Tech Stack

- Google BigQuery (data warehouse)
- SQL (transformation)
- Power BI (visualization)
- Git/GitHub (version control)

## 🚀 How to Reproduce

1. Create datasets: `hospital_bronze`, `hospital_silver`, `hospital_gold`
2. Run `sql/bronze_load.sql`
3. Run `sql/silver_clean.sql`
4. Run Gold scripts in `sql/`
5. Connect Power BI to `hospital_gold` tables

## 📌 Author

Your Name — [https://www.linkedin.com/in/mohamad-wajid-b29a7314/)
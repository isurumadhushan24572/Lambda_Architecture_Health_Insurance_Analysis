# Health Insurance Analysis Using Lambda Architecture on Azure

This project focuses on building a **Health Insurance Analytics System** using **Lambda Architecture** on Microsoft Azure. The system is designed to process both **historical** and **real-time** health insurance data to provide actionable insights for insurance companies, healthcare providers, and government agencies.

---

## 📌 Objectives

- Design and implement a scalable data analytics system using Azure.
- Process over 1 million historical records and real-time data streams.
- Enable real-time fraud detection and pricing optimization.
- Deliver insights into spending patterns across Medicare and Medicaid services.

---

## 📊 Dashboards (Power BI)

We developed three main dashboards connected via **Azure Synapse Analytics**:

1. **Insurance Claims Dashboard**
2. **Drug Claims Dashboard**
3. **Medicare Claims Dashboard**

Each dashboard provides rich visual insights with filters and drill-down capabilities.

---

## 📂 Data Sources

Data is sourced from the **Centers for Medicare & Medicaid Services (CMS)**:

1. **Medicaid Spending by Drug (2018–2022)**  
   - Outpatient drug costs, trends, manufacturers, and dosage pricing.  
   - [Link](https://data.cms.gov/summary-statistics-on-use-and-payments/medicare-medicaid-spending-by-drug/medicaid-spending-by-drug)

2. **Medicare Durable Medical Equipment by Referring Provider (2018–2022)**  
   - Spending on medical devices by healthcare providers.  
   - [Link](https://data.cms.gov/resources/medicare-durable-medical-equipment-devices-supplies-by-referring-provider-data-dictionary)

3. **Medicare Hospital Spending by Claim (2018–2022)**  
   - Hospital services, payments, and claim-level spending data.  
   - [Link](https://data.cms.gov/provider-data/dataset/nrth-mfg3)

---

## ⚙️ Architecture Overview

We implemented **Lambda Architecture** with the following layers:

### 🔁 Batch Layer
- Tools: Azure Data Factory, Data Lake, Databricks, Synapse
- Process: Ingest → Transform → Store in Silver Layer → Create Views & External Tables

### ⚡ Speed Layer
- Tools: Azure Event Hub, Stream Analytics
- Real-time streaming of new insurance claims data

### 🗂️ Serving Layer
- Unified batch + real-time views using `OPENROWSET()` in Synapse
- External tables created using views for Power BI access

### 📈 Presentation Layer
- Power BI dashboards visualizing insurance trends and costs

---

## 🔬 Performance Comparison

Compared **MapReduce (via RDD)** and **Apache Spark** performance on a record count task:
- Dataset: `Medicare_DME_DS`
- Condition: `Average_Supplier_Medicare_Payment_Amount > 100`
- Result: Spark significantly outperforms MapReduce in both speed and efficiency.

---

## 🧩 Challenges & Solutions

| Challenge | Solution |
|----------|----------|
| File corruption in Google Drive (>100MB) | Split files into sub-100MB chunks |
| Databricks cost | Single-node cluster + Auto-termination |
| Dynamic pipelines | Used parameterized JSON + Lookup Activities |

---

## 📁 Repository Structure

```bash
.
├── data/
│   ├── raw/         # Raw CSVs (2018–2022)
│   └── processed/   # Transformed parquet files
├── notebooks/
│   ├── batch_processing.ipynb
│   ├── speed_layer_simulation.ipynb
│   └── performance_comparison.ipynb
├── pipelines/
│   └── adf_dynamic_pipeline.json
├── synapse/
│   ├── create_views.sql
│   └── external_tables.sql
├── dashboards/
│   └── powerbi_dashboards.pbix
├── README.md
└── LICENSE

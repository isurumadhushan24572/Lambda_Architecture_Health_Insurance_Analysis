# Health Insurance Analytics System Using Lambda Architecture on Microsoft Azure

This project presents a **Health Insurance Analytics System** built using **Lambda Architecture** on **Microsoft Azure**, designed to process and analyze both historical and real-time healthcare claims data from Medicare and Medicaid sources. The system leverages Azure services to build a scalable, low-latency analytics pipeline and visualizes insights using Power BI.

---

## 📌 Project Objectives

- Build a scalable Lambda Architecture pipeline on Azure for healthcare data analytics.
- Integrate batch and real-time data from CMS datasets (Medicare & Medicaid).
- Enable real-time and historical insights on drug spending, equipment usage, and hospital claims.
- Visualize insights using interactive Power BI dashboards.
- Compare Spark vs. MapReduce performance using Databricks.

---

## 📊 Data Sources
 - [Dataset Link](https://data.cms.gov/)
   
1. **Medicaid Spending by Drug (2018–2022)**  
2. **Medicare Durable Medical Equipment by Referring Provider (2018–2022)**
3. **Medicare Hospital Spending by Claim (2018–2022)**

---

## 🏗️ Architecture

### Lambda Architecture Components:

- **Batch Layer:** Azure Data Factory, Azure Data Lake, Azure Databricks, Azure Synapse Analytics
- **Speed Layer:** Azure Event Hub, Azure Stream Analytics, Python Notebooks (Synthetic Data), Azure Data Lake
- **Serving Layer:** Views + External Tables in Synapse Analytics
- **Presentation Layer:** Power BI Dashboards

---

## ⚙️ Technologies Used

| Layer              | Services/Technologies                              |
|-------------------|----------------------------------------------------|
| Batch Layer        | ADF, ADLS, Azure Databricks, Synapse Analytics    |
| Speed Layer        | Azure Event Hub, ASA, Python, ADLS                |
| Serving Layer      | Synapse SQL Views, External Tables                |
| Presentation Layer | Power BI, Azure Synapse Connectivity              |

---

## 🧪 Performance Comparison: Spark vs MapReduce

A performance test was conducted on the `Medicare_DME_DS` dataset to compare:
- Spark with native APIs (in-memory)
- Spark RDDs simulating MapReduce

**Observation:** Spark outperformed MapReduce due to optimized DAG and in-memory execution.

---

## 📈 Power BI Dashboards

Interactive dashboards are built to show:
- **Insurance Claims Analysis**
- **Drug Claims Analysis**
- **Medicare Claims Analysis**

---

## 🛠️ Challenges & Solutions

| Challenge | Solution |
|----------|----------|
| Google Drive file corruption (>100MB) | Split files into chunks smaller than 100MB |
| High Databricks cost | Auto-termination + single-node cluster |
| Dynamic pipeline setup | Used parameterized JSON + Lookup Activity |
| No real-time data | Generated synthetic Medicare claims via Python |
| Spark vs. MapReduce testing | Implemented both using Databricks Notebooks |

---

## 👨‍💻 Team Contribution

| Student ID | Name                  | Contribution                             |
|------------|-----------------------|------------------------------------------|
| 24490      | M.R.K. Karunathilaka  | Data Source & Power BI Presentation Layer|
| 24572      | M.K.I.M. Rohana       | Batch Layer & Serving Layer              |
| 24614      | G.A.A.S. Ganegoda     | Speed Layer                              |

---

## 📜 License

This project is for academic and research purposes. All datasets are publicly available through CMS.gov. Reuse is allowed under proper citation.



-- DROP EXTERNAL TABLE gold.ext_medicare_ds;

SELECT * from gold.Medicare_DME_DS;

------- Use VIEW gold.Claims---
SELECT * FROM gold.Claims;
-------------------------------

------- Use VIEW gold.RealTime_Medicare_DME_DS---
SELECT * FROM gold.RealTime_Medicare_DME_DS;
-------------------------------



--SELECT * from gold.ext_claims;

SELECT COUNT(*) FROM 
    OPENROWSET(
        BULK'https://mylambdadatalake.blob.core.windows.net/silver/Claims/',
        FORMAT ='PARQUET'
    ) as Claims
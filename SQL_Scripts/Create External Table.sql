--- Create Master Key -------
CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Pzt7$mki';
-----------------------------

--- Create Database Scoped Credentials ----
CREATE DATABASE SCOPED CREDENTIAL credential_bd
WITH IDENTITY = 'Managed Identity';
-------------------------------------------

--- Create External Data Source for Silver -------

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://mylambdadatalake.blob.core.windows.net/silver', 
    CREDENTIAL =credential_bd 
);
--------------------------------------------------
--- Create External Data Source for Gold -------

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://mylambdadatalake.blob.core.windows.net/gold', 
    CREDENTIAL =credential_bd 
);
--------------------------------------------------

--- Create an external file format for Parquet files.
CREATE EXTERNAL FILE FORMAT format_parquet
WITH 
(
        FORMAT_TYPE = PARQUET,
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);


--- Create external table for Cliams ----

CREATE EXTERNAL TABLE gold.ext_claims
WITH
(
    LOCATION = 'ext_claims',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from gold.Claims;
------------------------------------------

--- Create external table for Drugs ----

CREATE EXTERNAL TABLE gold.ext_drugs
WITH
(
    LOCATION = 'ext_drugs',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from gold.Drugs;
------------------------------------------


--- Create external table for Medicare_DME_DS with combination of both batch & Realtime----

CREATE EXTERNAL TABLE gold.ext_medicare_ds
WITH
(
    LOCATION = 'ext_medicare_ds',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from gold.Medicare_DME_DS 
union 
SELECT * from gold.RealTime_Medicare_DME_DS;
------------------------------------------

--------------------------
---CREATE VIEW For Claims
--------------------------

CREATE VIEW gold.Claims
AS
SELECT * FROM 
OPENROWSET
(
    BULK 'https://mylambdadatalake.blob.core.windows.net/silver/Claims/',
    FORMAT ='PARQUET'
)  as View1Claims


--------------------------
---CREATE VIEW For Drugs
--------------------------

CREATE VIEW gold.Drugs
AS
SELECT * FROM 
OPENROWSET
(
    BULK 'https://mylambdadatalake.blob.core.windows.net/silver/Drugs/',
    FORMAT ='PARQUET'
) AS View2Drugs

--------------------------
---CREATE VIEW For Medicare_DME_DS
--------------------------

CREATE VIEW gold.Medicare_DME_DS
AS
SELECT * FROM 
OPENROWSET
(
    BULK 'https://mylambdadatalake.blob.core.windows.net/silver/Medicare_DME_DS/',
    FORMAT ='PARQUET'
) AS View2Medicare_DME_DS
UNION 
SELECT * 
FROM OPENROWSET
(
    BULK 'https://mylambdadatalake.blob.core.windows.net/gold/Stream_medicare/**',
    FORMAT = 'PARQUET'
) as ViewRealtime
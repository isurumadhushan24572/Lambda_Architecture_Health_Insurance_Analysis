-- Create View for Realtime Data for Medicare_DME_DS -------

CREATE VIEW gold.RealTime_Medicare_DME_DS
AS
SELECT 
    "Referring_NPI",
    "Referring_Provider_Last_Name_/_Organization_Name",
    "Referring_Provider_First_Name",
    "Referring_Provider_Middle_Initial",
    "Referring_Credentials",
    "Referring_Entity_Code",
    "Referring_Provider_Street_1",
    "Referring_Provider_Street_2",
    "Referring_Provider_City",
    "Referring_Provider_State",
    "Referring_Provider_State_FIPS_Code",
    "Referring_Provider_ZIP",
    "Rfrg_Prvdr_RUCA_Cat",
    "Referring_Provider_RUCA",
    "Referring_Provider_RUCA_Description",
    "Referring_Provider_Country",
    "Referring_Provider_Specialty_Code",
    "Referring_Provider_Specialty_Description",
    "Referring_Provider_Specialty_Source",
    "RBCS_Level",
    "RBCS_ID",
    "RBCS_Description",
    "HCPCS_Code",
    "HCPCS_Description",
    "Supplier_Rental_Indicator",
    "Number_of_Suppliers",
    "Number_of_Supplier_Beneficiaries",
    "Number_of_Supplier_Claims",
    "Number_of_Supplier_Services",
    "Average_Supplier_Submitted_Charges",
    "Average_Supplier_Medicare_Allowed_Amount",
    "Average_Supplier_Medicare_Payment_Amount",
    "Average_Supplier_Medicare_Standard_Payment_Amount" 
FROM OPENROWSET(
    BULK 'https://mylambdadatalake.blob.core.windows.net/gold/Stream_medicare/**',
    FORMAT = 'PARQUET'
) AS View_RealTime_Medicare_DME_DS;

----------------------------------------------------------------------------------



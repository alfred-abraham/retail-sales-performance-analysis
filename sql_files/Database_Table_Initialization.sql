-- Create database
CREATE database if not exists gold_datasets;

-- Import customers table and verify row count
SELECT COUNT(*) FROM gold_datasets.customers;
 
 -- Import products table and verify row count
 SELECT COUNT(*) FROM gold_datasets.products;
 
 -- Import sales table and verify row count
  SELECT COUNT(*) FROM gold_datasets.sales;
 
 
 -- All rows counts have been checked against the counts of the original csv documents. Time for analysis. 
 
 





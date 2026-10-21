# Data Cleaning Using SQL in Snowflake

A hands-on SQL project focused on improving data consistency in e-commerce and sales datasets using **Snowflake**. The project demonstrates how SQL `UPDATE` statements and `CASE` expressions can standardize inconsistent category values and correct spelling variations.

## Project Objectives

- Explore datasets and inspect existing records.
- Standardize inconsistent labels in categorical columns.
- Correct spelling variations in values.
- Validate updates by querying the data after changes.
- Practise SQL data preparation in Snowflake.

## Tools and Technologies

- **Snowflake** — cloud data warehouse and SQL execution environment
- **SQL** — data exploration and transformation
- **CSV** — source data format

## Repository Structure

```text
DATACLEANING_IN_SQL_USING_SNOWFLAKE/
├── FLIPKART.csv
├── Flipkart.sql
├── Orders_2024_Jan_Jun.csv
├── sales.sql
└── README.md
```

## Datasets

### `FLIPKART.csv`
An e-commerce orders dataset containing fields such as order dates, customer details, city, state, region, product information, quantity, sales, cost, profit, payment method, order status, and ratings.

### `Orders_2024_Jan_Jun.csv`
A sample orders dataset containing order, customer, region, product, quantity, price, total amount, and payment method fields.

## Cleaning Work Included

### 1. Standardizing gender values

The `Flipkart.sql` script maps abbreviated gender values to clearer labels:

```sql
UPDATE flipkart_ecom
SET GENDER = CASE
    WHEN GENDER = 'M' THEN 'Male'
    WHEN GENDER = 'F' THEN 'Female'
    ELSE GENDER
END;
```

### 2. Standardizing city names

Shortened city labels are converted to consistent names:

```sql
UPDATE flipkart_ecom
SET CITY = CASE
    WHEN CITY = 'Dl' THEN 'Delhi'
    WHEN CITY = 'Beng' THEN 'Bengaluru'
    WHEN CITY = 'Hyd' THEN 'Hyderabad'
    ELSE CITY
END;
```

### 3. Standardizing state names

Abbreviations and inconsistent spellings are normalized:

```sql
UPDATE flipkart_ecom
SET STATE = CASE
    WHEN STATE = 'MH' THEN 'Maharashtra'
    WHEN STATE = 'TN' THEN 'Tamil Nadu'
    ELSE STATE
END;

UPDATE flipkart_ecom
SET STATE = 'Karnataka'
WHERE STATE = 'Karnatak';
```

### 4. Standardizing sales regions

The `sales.sql` script standardizes abbreviated region labels:

```sql
UPDATE ecom
SET REGION = CASE
    WHEN REGION = 'E' THEN 'East'
    WHEN REGION = 'S' THEN 'South'
    WHEN REGION = 'W' THEN 'West'
    ELSE REGION
END;
```

The scripts also include basic database commands and `SELECT` queries to inspect data and review changes.

## How to Run the Project in Snowflake

1. Sign in to your Snowflake environment.
2. Upload the relevant CSV file using the data-loading workflow, or use a table that has already been created and populated.
3. Create or select the appropriate database and schema.
4. Ensure that the table names and column names in the SQL scripts match the tables you loaded.
5. Open `Flipkart.sql` or `sales.sql` in a Snowflake SQL worksheet.
6. Execute the statements in order, checking the selected database/schema and table names first.
7. Run `SELECT` queries after the updates to validate the results.

**Important:** The SQL scripts expect tables such as `FLIPKART_ECOM` and `ECOM` to exist. Loading a CSV file does not automatically guarantee that these exact table names are created. Create or rename the tables as needed before running the scripts.

## Validation Examples

Check the current values in a column:

```sql
SELECT DISTINCT CITY
FROM FLIPKART_ECOM
ORDER BY CITY;
```

Check the row count:

```sql
SELECT COUNT(*)
FROM FLIPKART_ECOM;
```

Review the standardized region values:

```sql
SELECT DISTINCT REGION
FROM ECOM
ORDER BY REGION;
```

## Notes on Data Quality

The SQL files currently included in this repository demonstrate **category standardization and spelling corrections**. If you also handled NULL values or duplicate records in your working version, add the corresponding SQL statements to the repository so those steps are reproducible and documented here.

For reliable data cleaning, identify the rules for each column before changing records. Where possible, keep a copy of the original data or perform transformations on a staging table so the changes can be checked and reversed.

## What I Learned

- Using SQL to inspect and transform real-world-style datasets.
- Applying `UPDATE`, `CASE`, `WHERE`, and `SELECT DISTINCT`.
- Standardizing inconsistent categorical values.
- Validating transformed data with follow-up queries.
- Understanding the role of data quality in downstream analysis.

## Future Improvements

- Add explicit NULL-value handling queries.
- Add duplicate-identification and duplicate-removal logic with a defined business key.
- Include before-and-after validation queries.
- Add a data-quality summary showing the number of records affected by each cleaning step.

## Author

**Srivardhan Jilla**

- LinkedIn: [linkedin.com/in/jilla-srivardhan](https://linkedin.com/in/jilla-srivardhan)
- GitHub: [github.com/jillasrivardhan](https://github.com/jillasrivardhan)

---

If you find this project useful, feel free to explore the SQL scripts and suggest improvements.

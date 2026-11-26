# Sales Data Analysis Using SQL

**Portfolio project | Entry-Level Data Analyst**

## Business objective
Analyze the Sample Superstore retail dataset to understand sales, profitability, product performance, customer segments, regional performance, discounting, and shipping patterns. The goal is to turn transactional data into practical business insights.

## Dataset
- Source: [Sample Superstore dataset on Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- Local project file: `data/superstore_cleaned.csv`
- Records: 9,994
- Fields: 23
- Geography: United States
- Period: 2014–2017

The CSV is included so the SQL project can be run immediately. Please retain the dataset attribution if you reuse or redistribute it.

## Tools
- SQL (SQLite-compatible syntax)
- DB Browser for SQLite / SQLiteStudio / SQLite command line
- CSV

## Repository structure
```text
sales-analysis-sql/
├── data/
│   └── superstore_cleaned.csv
├── sql/
│   ├── 01_create_table.sql
│   ├── 02_analysis_queries.sql
│   └── 03_validation_checks.sql
└── README.md
```

## How to run
1. Download and install [DB Browser for SQLite](https://sqlitebrowser.org/).
2. Create a new database named `superstore.db`.
3. Open the **Execute SQL** tab.
4. Run `sql/01_create_table.sql` to create the table.
5. Import `data/superstore_cleaned.csv` into the table named `superstore` (or use the CSV import option and map columns in the same order).
6. Run queries from `sql/02_analysis_queries.sql`.
7. Run `sql/03_validation_checks.sql` to validate row counts and key metrics.

**Import note:** If you import the CSV through DB Browser, choose the existing `superstore` table and confirm that the first row contains column names. The table definition uses text for dates so SQLite can sort ISO dates correctly.

## Key findings (from the included dataset)
- Total sales: **$2,297,200.86**
- Total profit: **$286,397.02**
- Overall profit margin: **12.47%**
- Unique orders: **5,009**
- Unique customers: **793**
- Units sold: **37,873**
- 2017 recorded the highest annual sales (approximately **$733,215.26**).
- Technology generated the highest category sales (approximately **$836,154.03**) and category profit (approximately **$145,454.95**).
- The West region had the highest regional sales (approximately **$725,457.82**).
- Tables, Bookcases, and Supplies had negative total profit in the sub-category summary.

## Business recommendations
1. Review discounting and cost drivers for loss-making sub-categories, especially Tables and Bookcases.
2. Investigate the sales practices and product mix behind Technology's strong contribution.
3. Compare regional performance and test whether successful West-region practices can be applied elsewhere.
4. Monitor sales and profit together; revenue growth alone does not guarantee profitability.

## Important methodology notes
- Sales and profit are summed at the order-line level.
- Order count uses `COUNT(DISTINCT order_id)` to avoid counting multi-line orders multiple times.
- Customer count uses `COUNT(DISTINCT customer_id)`.
- Profit margin is calculated as total profit divided by total sales, not as an unweighted average of row-level margins.
- Negative profit is retained; it is a meaningful business outcome, not a data error.

## Project status
This is a completed SQL analysis starter portfolio project with the dataset, table definition, analysis queries, and validation checks. Add screenshots of selected query results to this README after running it in your SQL tool.

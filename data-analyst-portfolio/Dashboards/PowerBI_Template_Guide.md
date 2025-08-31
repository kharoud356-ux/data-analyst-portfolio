# Power BI Template Guide (PBIT) – Sales & Churn

## Files you need
- `Datasets/sales_data.csv`
- `Datasets/customer_churn.csv`

## Steps
1. **Get Data → Text/CSV** → Load both CSVs
2. **Model**:
   - Create relationships if needed (e.g., Date table to sales date).
3. **DAX Measures (examples)**:
```
Total Sales = SUM(sales[sales])
Top Product Sales = CALCULATE([Total Sales], TOPN(1, VALUES(sales[product]), [Total Sales], DESC))
Churn Rate = DIVIDE( SUM(churn[churned]), COUNTROWS(churn) )
```
4. **Visuals**:
   - Bar: Top 5 products by Sales
   - Line: Monthly Sales Trend
   - Card: Churn Rate
   - ROC image: add `Dashboards/dashboard_screenshots/churn_roc.png`
5. **Theme**: View → Themes → choose a dark theme or import JSON.
6. **Export**: File → Export → Power BI template (`.pbit`).

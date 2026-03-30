# Skill: Data Science

Write data analysis pipelines, produce statistical insights, clean messy datasets, build visualisations, and validate machine-learning–adjacent workflows.

---

## Overview

Claude can write and review Python (pandas, numpy, scipy, matplotlib, seaborn, plotly), R, and SQL data workflows, explain statistical concepts, help interpret results, and design analysis plans for business questions.

---

## Task Patterns

### 1. Exploratory Data Analysis (EDA)

**Prompt template:**
```
Perform an exploratory data analysis on the following dataset.

Dataset description:
- Source: [e.g., CSV export from PostgreSQL, Kaggle dataset]
- Rows: [N], Columns: [list or paste schema]
- Business context: [what this data represents]

[language: python/R]
[paste first 20 rows as CSV/JSON or paste the schema]

Generate code to:
1. Display shape, dtypes, null counts, and basic statistics
2. Identify distributions of numeric columns (histogram + box plot)
3. Identify cardinality and top values for categorical columns
4. Find correlations between numeric features
5. Flag potential data quality issues
```

---

### 2. Clean and Preprocess a Dataset

**Prompt template:**
```
Clean the following dataset for analysis.

Known issues:
- [e.g., missing values in column X, outliers in column Y, inconsistent date formats]
- [e.g., duplicate rows, mixed types in column Z]

[language]
[paste sample data or schema + sample]

Write a cleaning pipeline that:
1. Handles missing values (drop / impute — justify the choice)
2. Removes or caps outliers (method: IQR / z-score / domain knowledge)
3. Standardises formats (dates, strings, categories)
4. Deduplicates
5. Produces a before/after quality report
```

---

### 3. Answer a Business Question with Data

**Prompt template:**
```
Answer the following business question using this dataset:

Question: [e.g., "Which customer segments have the highest churn rate?"]

Dataset:
- Tables / columns available: [describe]
- Sample data: [paste rows or schema]

Write [SQL / Python / R] code to:
1. Define and calculate the relevant metric
2. Slice by the relevant dimensions
3. Visualise the result
4. Summarise the finding in one sentence
```

---

### 4. Statistical Hypothesis Test

**Prompt template:**
```
I want to test whether [hypothesis, e.g., "users who see the new banner have higher conversion"].

Groups:
- Control: [N = X, describe]
- Treatment: [N = Y, describe]

Metric: [e.g., conversion rate, average order value]

[paste data or summary statistics]

Choose the appropriate statistical test, check assumptions, run the test, interpret the p-value and effect size, and state the business conclusion.
```

---

### 5. Build a Data Pipeline

**Prompt template:**
```
Write a [Python / SQL] data pipeline for the following transformation:

Source: [database table / CSV / API endpoint]
Destination: [target table / DataFrame / file]
Transformation logic:
- [step 1]
- [step 2]
- [step 3]
Volume: [rows/day]

Requirements:
- Idempotent (safe to re-run)
- Handles schema changes gracefully
- Logs row counts at each step
- Raises an error if output row count deviates by more than X% from input
```

---

### 6. Visualise Data

**Prompt template:**
```
Create a [chart type, e.g., time-series line chart / heatmap / scatter plot with regression line] using [matplotlib / seaborn / plotly / ggplot2].

Data: [paste data or describe structure]

Requirements:
- Title, axis labels, and legend
- Colour palette accessible to colour-blind users
- Annotations for key data points: [describe]
- Export to [PNG / SVG / HTML]
```

---

## Advanced Techniques

### Feature Engineering

```
Generate feature engineering ideas for predicting [target variable] from this dataset:

[paste schema and sample rows]

For each feature idea:
1. Describe the feature and how to compute it
2. Explain the business intuition
3. Flag any data leakage risks
4. Provide the [Python/SQL] code to compute it
```

### Cohort Analysis

```
Perform a cohort analysis on this user activity dataset.

Dataset columns: [user_id, event_date, event_type, ...]
[paste sample]

Cohort definition: users grouped by [first purchase month / signup week / etc.]
Metric: [retention rate / revenue / engagement]
Time window: [N periods]

Output: cohort retention matrix as a heatmap + interpretation.
```

### Time-Series Decomposition

```
Decompose the following time series and forecast [N] periods ahead.

Data: [paste or describe: date column, value column, frequency]
Known seasonality: [daily / weekly / yearly / unknown]

Perform:
1. Decomposition (trend, seasonality, residual)
2. Stationarity test (ADF)
3. Fit an appropriate model ([ARIMA / Prophet / ETS])
4. Forecast with confidence intervals
5. Evaluate on a held-out test set (MAPE, RMSE)
```

---

## Statistical Concept Quick Reference

| Concept | When to Use |
|---|---|
| t-test | Compare means of two groups (continuous outcome) |
| Chi-squared test | Compare proportions / categorical distributions |
| ANOVA | Compare means across 3+ groups |
| Mann-Whitney U | Non-parametric alternative to t-test |
| Pearson correlation | Linear relationship between two continuous variables |
| Spearman correlation | Monotonic relationship, non-normal data |
| Power analysis | Determine required sample size before running an experiment |

---

## Data Science Checklist

- [ ] Data source and freshness understood
- [ ] Missing data assessed and handled with documented rationale
- [ ] Outliers identified and treated appropriately
- [ ] Statistical test assumptions checked before applying test
- [ ] Effect size reported alongside p-value
- [ ] Visualisations labelled and accessible
- [ ] Analysis is reproducible (seed set, pipeline is deterministic)
- [ ] Findings translated into a plain-language business conclusion
- [ ] No data leakage in feature engineering or train/test split

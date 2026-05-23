Cafe Sales Performance Analysis ☕📊
Overview

This project presents an end-to-end business intelligence and analytics workflow for a multi-location retail cafe. The objective was to transform raw transactional data into actionable business insights through structured data cleaning, exploratory analysis, and interactive dashboard reporting.

The project simulates a real corporate analytics pipeline by combining:

SQL for data engineering and cleansing
Python for statistical exploration and feature analysis
Power BI for executive-level dashboarding and KPI monitoring
Business Problem

Retail transactional datasets often contain:

Missing values
Corrupted records
Inconsistent formatting
Revenue calculation errors
Duplicate entries

The goal of this project was to:

Build a clean and reliable analytical dataset
Analyze customer purchasing behavior
Monitor operational performance
Identify revenue-driving products and channels
Deliver business-ready dashboards for decision-making
Tech Stack
Layer	Tools Used
Data Cleaning & Staging	MySQL
Exploratory Data Analysis	Python
Libraries	Pandas, NumPy, Matplotlib, Seaborn
Visualization & BI	Power BI
Environment	Jupyter Notebook
Project Architecture
[ Raw CSV Data ]
         │
         ▼
    ┌──────────┐
    │  MySQL   │
    │----------│
    │ Staging  │
    │ Cleaning │
    │ Validation
    └──────────┘
         │
         ▼
    ┌──────────┐
    │ Python   │
    │----------│
    │ EDA      │
    │ Trends   │
    │ Features │
    └──────────┘
         │
         ▼
    ┌──────────┐
    │ Power BI │
    │----------│
    │ KPIs     │
    │ Dashboards
    │ Insights │
    └──────────┘
Data Cleaning & Engineering (SQL)

A defensive SQL workflow was implemented to preserve data integrity before analysis.

Key Cleaning Processes
Staging Infrastructure
Created a dedicated staging environment:
staging_dirty_cafe_sales
Isolated anomalies before modifying the production dataset.
Structural Anomaly Detection

Targeted corrupted values such as:

'UNKNOWN'
'ERROR'
Empty fields

Affected columns included:

Item
Payment Method
Location
Revenue Validation Logic

Validated transactional consistency using:

Total Spent=Quantity×Price Per Unit

This ensured all sales records followed expected business logic.

Date Standardization

Converted inconsistent date strings into SQL DATE format using:

STR_TO_DATE()
Exploratory Data Analysis (Python)

The cleaned dataset was analyzed using Python inside a Jupyter Notebook environment.

Analytical Tasks Performed
Missing Value Analysis
df.isna().sum()
Duplicate Detection
df.duplicated().sum()
Feature Engineering

Created additional analytical dimensions such as:

Month
Seasonal patterns
Revenue periods
Time-Series Preparation

Interpolated missing chronological gaps to support continuous trend analysis.

Power BI Dashboard Development

The refined dataset was imported into Power BI for interactive reporting.

Dashboard Features
Dynamic KPI cards
Revenue trend analysis
Product performance tracking
Payment method analysis
Operational channel comparison
Interactive filtering and drill-down capabilities
Key Business KPIs
Financial Metrics
Total Revenue

Tracks overall business income across all branches.

Average Transaction Value (ATV)

ATV=
Total Transactions/
Total Revenue
	​


Measures customer spending behavior and upselling potential.

Product Unit Economics

Evaluates pricing and profitability across menu items.

Operational Metrics
Total Units Sold

Measures sales volume and inventory movement.

Transaction Velocity

Tracks customer throughput and purchasing frequency.

Consumer Behavior Analysis
Payment Method Distribution

Analyzed adoption across:

Cash
Credit Card
Digital Wallet
Fulfillment Channel Analysis

Compared operational patterns between:

In-store
Takeaway
Time-Series Insights
Monthly Revenue Trends

Tracked seasonality and revenue momentum over time.

Key Findings
Operational Channels

In-store and takeaway channels showed significantly different operational behaviors, impacting staffing and service requirements.

Product Performance
Low-ticket products like Cookies and Tea generated high transaction frequency.
Premium items such as Smoothies, Sandwiches, and Salads contributed the largest share of revenue.
Consumer Payment Trends

Digital Wallet adoption represented a major portion of total transactions, highlighting the importance of seamless digital payment systems.

Business Recommendations
Menu Engineering

Bundle high-margin products with high-frequency drinks to increase Average Transaction Value.

Example:

Sandwich + Coffee bundles during peak hours
Workforce Optimization

Adjust staffing schedules according to identified peak transaction periods.

Inventory Management

Use product velocity tracking to:

Reduce overstocking
Improve replenishment cycles
Minimize perishable waste
Project Deliverables
SQL Data Cleaning Scripts
Python EDA Notebook
Power BI Interactive Dashboard
Business KPI Framework
Executive-Level Insights
Skills Demonstrated
Data Engineering
SQL Cleaning
Data Validation
Data Integrity Enforcement
Data Analysis
Exploratory Data Analysis
Time-Series Analysis
Statistical Investigation
Business Intelligence
Dashboard Design
KPI Modeling
Data Storytelling
Business Understanding
Revenue Optimization
Consumer Behavior Analysis
Operational Performance Monitoring
Future Improvements

Potential future enhancements include:

Predictive sales forecasting
Customer segmentation models
Inventory optimization algorithms
Real-time dashboard integration
Automated ETL pipelines
Author

Dolaimin Yaya KONE

Aspiring Data Analyst | Supply Chain & Business Intelligence Enthusiast

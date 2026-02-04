# 💳 Credit Card Transactions Analysis

<div align="center">

![SQL](https://img.shields.io/badge/SQL-Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![TSQL](https://img.shields.io/badge/T--SQL-Analysis-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Data-Analysis-4285F4?style=for-the-badge&logo=google-analytics&logoColor=white)

*A comprehensive SQL-based analysis of credit card transactions to uncover spending patterns, city-wise contributions, card-type behaviors, and customer segmentation.*

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Dataset](#-dataset)
- [Project Structure](#-project-structure)
- [Key Features](#-key-features)
- [Business Questions Analyzed](#-business-questions-analyzed)
- [Technologies Used](#-technologies-used)
- [Getting Started](#-getting-started)
- [SQL Analysis Highlights](#-sql-analysis-highlights)
- [Insights & Findings](#-insights--findings)
- [Future Enhancements](#-future-enhancements)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

This project performs an in-depth analysis of credit card transaction data using **SQL Server (SSMS)** to extract meaningful business insights. The analysis focuses on understanding customer spending behavior, identifying high-value transactions, evaluating card type performance, and discovering patterns across different cities and expense categories.

The project demonstrates advanced SQL techniques including window functions, CTEs, aggregations, and complex joins to solve real-world business problems.

---

## 📊 Dataset

The dataset contains credit card transaction records with the following attributes:

- **Transaction Details**: Transaction ID, Date, Amount
- **Card Information**: Card Type (Gold, Silver, Platinum, Signature)
- **Customer Information**: Customer demographics and profiles
- **Location Data**: City-wise transaction information
- **Expense Categories**: Various spending categories

> **Source**: Sample dataset based on Kaggle credit card transactions

---

## 📁 Project Structure

```
credit_card_transactions_analysis/
│
├── credit_card_transactions/
│   ├── data/
│   │   └── credit_card_sample.csv          # Sample transaction dataset
│   │
│   └── sql/
│       ├── 01_create_tables.sql            # Database schema creation
│       ├── 02_data_import.sql              # Data loading scripts
│       └── 03_business_queries.sql         # Analysis queries
│
└── README.md                                # Project documentation
```

---

## 🔑 Key Features

- ✅ **Comprehensive Data Analysis**: 9+ business-critical SQL queries
- ✅ **Window Functions**: Advanced ranking and partitioning techniques
- ✅ **Transaction Pattern Analysis**: Spending trends and anomaly detection
- ✅ **City-wise Insights**: Geographic spending distribution
- ✅ **Card Type Performance**: Comparative analysis across card categories
- ✅ **Customer Segmentation**: High-value customer identification
- ✅ **Expense Category Breakdown**: Detailed spending pattern analysis

---

## 💼 Business Questions Analyzed

The SQL queries in this project answer critical business questions:

1. **Top Spending Cities** - Which cities generate the highest transaction volumes?
2. **High-Value Transactions** - Identify transactions with amounts exceeding specific thresholds
3. **Card Type Distribution** - Analyze spending patterns across Gold, Silver, Platinum, and Signature cards
4. **Expense Category Analysis** - Which categories dominate customer spending?
5. **Customer Segmentation** - Identify top spenders and their characteristics
6. **Monthly Spending Trends** - Track spending patterns over time
7. **Transaction Frequency** - Analyze customer transaction behavior
8. **City-wise Revenue Contribution** - Calculate percentage contribution by location
9. **Anomaly Detection** - Identify unusual spending patterns

---

## 🛠 Technologies Used

| Technology | Purpose |
|-----------|---------|
| **SQL Server (SSMS)** | Database management and query execution |
| **T-SQL** | Advanced query language for data analysis |
| **Window Functions** | Ranking, aggregation, and partitioning |
| **CTEs** | Complex query structuring |
| **Aggregate Functions** | Statistical calculations |

---

## 🚀 Getting Started

### Prerequisites

- Microsoft SQL Server (2016 or later)
- SQL Server Management Studio (SSMS)
- Basic understanding of SQL and data analysis

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Chaflegaurav215/credit_card_transactions_analysis.git
   cd credit_card_transactions_analysis
   ```

2. **Set up the database**
   - Open SSMS and connect to your SQL Server instance
   - Create a new database:
     ```sql
     CREATE DATABASE CreditCardAnalysis;
     ```

3. **Create tables**
   - Open `sql/01_create_tables.sql` in SSMS
   - Execute the script to create the required table structure

4. **Import data**
   - Use the Import/Export wizard in SSMS or run `sql/02_data_import.sql`
   - Load data from `data/credit_card_sample.csv`

5. **Run analysis queries**
   - Open `sql/03_business_queries.sql`
   - Execute queries individually or in sequence to generate insights

---

## 📈 SQL Analysis Highlights

### Sample Query 1: Top 5 Cities by Transaction Amount

```sql
SELECT TOP 5 
    city,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_transaction_amount
FROM credit_card_transactions
GROUP BY city
ORDER BY total_amount DESC;
```

### Sample Query 2: Card Type Performance

```sql
WITH CardTypeStats AS (
    SELECT 
        card_type,
        COUNT(*) AS transaction_count,
        SUM(amount) AS total_spent,
        AVG(amount) AS avg_transaction
    FROM credit_card_transactions
    GROUP BY card_type
)
SELECT 
    card_type,
    transaction_count,
    total_spent,
    avg_transaction,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM CardTypeStats;
```

### Sample Query 3: Monthly Spending Trends

```sql
SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    SUM(amount) AS monthly_total,
    COUNT(*) AS transaction_count,
    LAG(SUM(amount)) OVER (ORDER BY YEAR(transaction_date), MONTH(transaction_date)) AS prev_month_total
FROM credit_card_transactions
GROUP BY YEAR(transaction_date), MONTH(transaction_date)
ORDER BY year, month;
```

---

## 💡 Insights & Findings

Key insights derived from the analysis:

- 🏙️ **Geographic Patterns**: Certain cities contribute disproportionately to overall transaction volume
- 💎 **Premium Card Dominance**: Platinum and Signature cards show higher average transaction amounts
- 📊 **Spending Categories**: Specific expense categories drive the majority of transactions
- 👥 **Customer Behavior**: A small percentage of customers contribute to a large portion of revenue (Pareto Principle)
- 📅 **Seasonal Trends**: Spending patterns vary significantly across different months
- 🎯 **High-Value Customers**: Top 10% of customers generate substantial revenue share

---

## 🔮 Future Enhancements

- [ ] Add interactive Power BI dashboard for visualization
- [ ] Implement fraud detection algorithms
- [ ] Create stored procedures for automated reporting
- [ ] Add temporal analysis using time series techniques
- [ ] Integrate with Python for machine learning predictions
- [ ] Build customer lifetime value (CLV) models
- [ ] Add cohort analysis functionality
- [ ] Implement real-time transaction monitoring

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---


<div align="center">

**⭐ If you find this project useful, please consider giving it a star!**

Made with ❤️ by Gaurav Chafle

</div>

# Financial Customer Intelligence & Risk Analytics

### Customer Behavior, Transaction Performance & Payment Risk Analysis

> An end-to-end financial analytics project built using a **synthetic dataset of 85,000 records across 4 related tables**, designed to analyze customer behavior, card portfolio performance, transaction activity, payment behavior, and payment-risk indicators using **Excel, Power Query, MySQL, SQL, DAX, and Power BI**.

---

## 📌 Project Overview

Financial institutions generate large volumes of customer, card, transaction, and payment data. Analyzing these datasets together can help identify customer behavior patterns, monitor transaction performance, understand card portfolio activity, and identify payment-risk indicators.

This project simulates a financial-services analytics environment using a **synthetic dataset created specifically for educational and portfolio purposes**.

The project covers:

- Customer intelligence
- Card portfolio analysis
- Transaction performance
- Payment behavior
- Days Past Due (DPD) analysis
- Customer-level risk indicators
- SQL-based business analysis
- Power BI dashboard development
- Business insights and recommendations

### Analytical Workflow

**Business Problem → Data Profiling → Data Quality Validation → SQL Analysis → Data Modeling → DAX → Power BI → Business Insights → Recommendations**

---

# 🎯 Business Objectives

The project aims to answer the following key business questions.

### Customer Intelligence

- Who are the customers?
- How are customers distributed by employment type and geography?
- How does credit score vary across customer segments?
- How many cards do customers own?

### Card Portfolio

- How is the card portfolio distributed by card type?
- What proportion of cards are active, inactive, blocked, or closed?
- Which card types have higher portfolio representation?

### Transaction Performance

- What is the overall transaction approval rate?
- How much approved transaction value is generated?
- How does transaction value vary by card type?
- Which merchant categories contribute the most transaction value?
- How does transaction activity vary over time?
- How does domestic activity compare with international activity?

### Payment Behavior

- What proportion of payments are on time, late, partial, or missed?
- How does payment behavior vary across card types?
- How does payment behavior vary across employment segments?

### Payment Risk Indicators

- What is the average Days Past Due?
- Which customers have higher cumulative DPD?
- Which customer segments may require deeper payment-behavior review?

---

# 📊 Dataset

## Synthetic Dataset

This project uses a **synthetic financial dataset created for educational and portfolio purposes**.

The dataset was designed to simulate relationships between customers, cards, transactions, and payments so that the project could demonstrate realistic data-analysis workflows without using confidential, proprietary, or personally identifiable financial information.

### Dataset Size

**85,000 records across 4 related tables**

| Table | Records | Description |
|---|---:|---|
| Customers | 10,000 | Customer demographics, income and credit information |
| Cards | 12,000 | Card ownership, type, status and credit limits |
| Transactions | 50,000 | Transaction activity, amount, status and merchant information |
| Payments | 13,000 | Payment behavior, status and Days Past Due |
| **Total** | **85,000** | **Integrated synthetic financial dataset** |

> **Note:** The dataset does not contain real customer information and should not be interpreted as real financial-institution data.

---

# 🔗 Data Model

The Power BI model uses a relational structure connecting customers, cards, transactions, and payments.

```text
                    Customers
                        │
                        │ 1 : *
                        ▼
                      Cards
                     /     \
                    /       \
                   ▼         ▼
            Transactions   Payments

# A Study on Product Sales through the Alibaba Wholesale E-Commerce Platform
### (Database Design Case Study — JBL Wireless Bluetooth Earbuds)

A 3rd Semester Skill Project that models and analyzes a B2B wholesale e-commerce platform (Alibaba.com) using a relational database. The project uses **JBL Bluetooth Earbuds** as a real-world case study, based on actual supplier listing data (MOQ, pricing, units sold) pulled from Alibaba.com.

---

##  Problem Statement

Alibaba.com is a large-scale B2B wholesale e-commerce platform where thousands of suppliers list products with varying MOQs, prices, and sales volumes. Buyers currently have no structured way to track, compare, and analyze supplier data across multiple listings in one place — making sourcing decisions slow and error-prone.

This project designs and implements a relational database that models a wholesale e-commerce platform, allowing users to query supplier performance, product sales, and customer purchase patterns to support informed sourcing decisions.

---

##  Objectives

- Understand how a wholesale product listing functions on a B2B platform
- Study pricing structure, MOQ patterns, and supplier landscape
- Design a normalized database (Suppliers, Products, Customers, Orders)
- Analyze sales volume and customer trends through SQL queries
- Highlight real-world sourcing considerations (e.g., brand authenticity)

---

##  Stakeholders

| Stakeholder | Role |
|---|---|
| Suppliers/Manufacturers | List products, set MOQ & pricing |
| Wholesale Buyers/Customers | Compare & purchase products |
| Platform Administrator | Verifies suppliers, manages transactions |
| Database Administrator | Maintains schema & data integrity |
| Academic Evaluator | Assesses the project |
| End Analysts | Use query outputs for decisions |

---

##  Database Design

**Core Entities:** `Suppliers`, `Products`, `Customers`, `Orders`

```
Supplier ──lists──▶ Product ──ordered in──▶ Order ◀──placed by── Customer
```

- A **Supplier** can list many **Products** (1-to-many)
- A **Customer** can place many **Orders** (1-to-many)
- Each **Order** links one Customer, one Product, and one Supplier
- `units_sold` on Products updates automatically as Orders are placed

### Sample Tables

**Suppliers**
| supplier_id (PK) | name | location | certification |
|---|---|---|---|

**Products**
| product_id (PK) | name | category | price | moq | supplier_id (FK) | units_sold |
|---|---|---|---|---|---|---|

**Customers**
| customer_id (PK) | name | contact | location |
|---|---|---|---|

**Orders**
| order_id (PK) | customer_id (FK) | product_id (FK) | supplier_id (FK) | quantity | order_date | total_value |
|---|---|---|---|---|---|---|

---

##  Business Requirements (Summary)

- Maintain supplier, product, customer, and order records
- Track units sold per listing and support supplier comparison
- Identify repeat customers
- Enforce data integrity via primary/foreign keys
- Support reporting and analytics queries

##  Functional Requirements (Summary)

- CRUD operations for Suppliers, Products, Customers, Orders
- Auto-calculate order totals and update units sold
- Query top-selling products, supplier comparisons, repeat buyers
- Validate order quantity against MOQ
- Role-based access (admin vs. buyer)

##  Non-Functional Requirements (Summary)

- Fast query response (2–3 sec)
- Scalable to growing data volume
- Reliable, consistent, and normalized (3NF) schema
- Secure admin-only write access
- Portable across MySQL / Oracle / MS Access

---

##  Sample Data (Real Alibaba Listings — JBL Earbuds)

| Supplier | MOQ | Units Sold | Type | Location |
|---|---|---|---|---|
| Shenzhen Qiyouming Trading Co. | 1 piece | 40 | OEM/compatible | Shenzhen |
| Guangzhou Senbida Int'l Trade Co. | 10 pieces | 7,814 | OEM/compatible | Guangzhou |
| Guangzhou Langston Electronic Tech Co. | 1 piece | 45 | OEM/compatible | Guangzhou |
| Shenzhen Alex Technology Co. | 10 pieces | 2,622 | OEM/compatible | Shenzhen |
| Shenzhen Yitaiwenhua Technology Co. | 5 pieces | 1,339 | OEM/compatible | Shenzhen |
| Dongguan Yoright Electronic Tech Co. | 20 parcels | 4 | OEM/compatible | Dongguan |

*Source: Alibaba.com "Best JBL Earbuds" showroom listings (accessed July 2026).*

**Key Insight:** Low-MOQ listings accumulate far more sales, since they lower the risk/cost barrier for first-time buyers.

---

##  Tech Stack

- **Database:** MySQL / Oracle / MS Access *(update based on your implementation)*
- **Documentation:** Word / Markdown
- **Diagrams:** ER Diagram (draw.io / dbdiagram.io)

---

##  Repository Structure

```
├── README.md
├── docs/
│   └── A_STUDY_ON_PRODUCT_SALES.docx     # Full project report
├── database/
│   ├── schema.sql                        # Table creation scripts
│   ├── sample_data.sql                   # Insert statements
│   └── queries.sql                       # Reporting queries
└── diagrams/
    └── er_diagram.png                    # Entity-Relationship diagram
```

---

##  Getting Started

```bash
# Clone the repository
git clone https://github.com/<your-username>/<repo-name>.git

# Import schema into your DBMS
mysql -u root -p your_database < database/schema.sql
mysql -u root -p your_database < database/sample_data.sql

# Run sample queries
mysql -u root -p your_database < database/queries.sql
```

---

##  Conclusion

This project demonstrates how a structured relational database can streamline sourcing and sales analysis on a B2B wholesale e-commerce platform. Using JBL Bluetooth earbuds as a case study, it applies core database concepts — entity design, normalization, relationships, and query-based reporting — to a practical, real-world scenario, while also highlighting real business nuances like brand authenticity verification in B2B sourcing.

---

##  License

This project is submitted as part of academic coursework (3rd Semester Skill Project) and is intended for educational purposes only.

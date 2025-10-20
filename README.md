# 🍽️ Restaurant Reservation Management System: Database Project

## 📖 Background

A group of restaurants wishes to transition from their traditional ordering and reservation system to a more robust digital platform. They are looking for a system that can efficiently manage their restaurant operations, including tracking orders, menu items, reservations, and more.

## 🎯 Objective

Design and implement a relational database using **Microsoft SQL Server (MS SQL)** that supports the restaurant’s operations and offers extensive querying capabilities.

---

## 🧩 Project Structure

```
.
├── Functions_And_Procedures/      # User-defined functions, triggers, and stored procedures
├── Indexes/                       # SQL scripts for indexing and query optimization
├── Queries/                       # Complex SQL queries, views, and reports
├── schema_creation.sql            # Database schema and table creation script
├── seed_data.sql                  # Data seeding script for populating sample data
└── README.md                      # Project documentation
```

---

## 🧠 Database Design

### **Entity Relationship Diagram (ERD)**

The following diagram illustrates the entities, attributes, and relationships within the database:

<img width="1022" height="726" alt="Restaurant Reservation Management System - ERD" src="https://github.com/user-attachments/assets/edf33273-7822-4fd4-825a-951c6314e86c" />

---

## 🧱 Database Schema (Relational Model)

Implemented using MS SQL Server. The schema includes all primary and foreign key relationships as defined in the ERD.  
The core tables include:
- Restaurants
- MenuItems
- Orders
- OrderItems
- Employees
- Customers
- Reservations
- RestaurantTables

---

## 🌱 Data Seeding

- 50 restaurants  
- 1000 menu items  
- 1500 order items  
- 500 orders  
- 100 employees  
- 500 reservations  
- 400 customers  
- 100 tables  

The seeding is handled through **`seed_data.sql`**, which provides meaningful and consistent sample data for testing and query execution.

---

## ⚙️ Implemented Features

### **1. Complex Queries**

### **2. Views**

### **3. Common Table Expressions (CTEs)**

### **4. Window Functions**

### **5. User-Defined Functions**

### **6. Stored Procedures**

### **7. Trigger**

### **8. Indexing and Query Optimization**
---

## 🧰 Tools Used

- **Microsoft SQL Server Management Studio (SSMS)**  
- **Lucidchart** for diagram creation  
- **T-SQL** for database design and scripting

---

## :stars: Acknowledgment

Special thanks to [**Foothill Technology Solutions**](https://www.foothillsolutions.com/) for the opportunity to work on this project during my internship.  
The experience and knowledge gained have been invaluable.

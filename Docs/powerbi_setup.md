# 📊 Power BI Setup Guide – RetailIQ

This document explains how to build the Power BI dashboard for the RetailIQ project.

---

## 🧩 Step 1: Connect to Database

1. Open Power BI Desktop  
2. Click **Get Data → MySQL Database**  
3. Enter:
   - Server: `localhost`
   - Database: `retailiq`
4. Select and load these tables:
   - customers
   - products
   - orders
   - order_items  

---

## 🔗 Step 2: Create Relationships

Go to **Model View** and ensure:

- customers.customer_id → orders.customer_id  
- orders.order_id → order_items.order_id  
- products.product_id → order_items.product_id  

All relationships should be **Many-to-One**.

---

## 🧮 Step 3: Create Measures (DAX)

Go to **Modeling → New Measure**

### 1. Total Revenue
Total Revenue = SUMX(order_items, order_items.quantity * RELATED(products.price))


### 2. Total Orders
Total Orders = COUNT(orders[order_id])


### 3. Total Customers
Total Customers = DISTINCTCOUNT(customers[customer_id])



---

## 📊 Step 4: Create Visuals

### 1. KPI Cards
- Total Revenue  
- Total Orders  
- Total Customers  

---

### 2. Revenue by Region (Bar Chart)
- Axis: customers.region  
- Values: Total Revenue  

---

### 3. Top Products (Bar Chart)
- Axis: products.product_name  
- Values: SUM(order_items.quantity)  

---

### 4. Monthly Sales Trend (Line Chart)
- Axis: orders.order_date (Month)  
- Values: Total Revenue  

---

### 5. Top Customers (Table)
Columns:
- customer_name  
- Total Revenue  

---

## 🎨 Step 5: Basic Formatting

- Use dark or clean theme  
- Add titles to all visuals  
- Align visuals in grid layout  

---

## 🧠 Dashboard Goal

The dashboard should answer:

- Where is revenue coming from?  
- Who are the top customers?  
- Which products perform best?  
- What trends exist over time?  

---
## ✅ Final Output

A Power BI dashboard that provides:

- Business insights  
- Data-driven decision support  
- Clear visualization of retail performance
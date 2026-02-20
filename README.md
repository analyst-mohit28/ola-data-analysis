# Ola Ride Booking Data Analysis

## 📌 Project Overview

This project analyzes 103,024 ride bookings to evaluate operational efficiency, revenue performance, and customer behavior patterns in a ride-hailing platform.

The goal is to identify revenue drivers, cancellation issues, and strategic improvement areas using SQL and Power BI.

---

## 📊 Key Performance Indicators (KPIs)

- **Total Bookings:** 103,024  
- **Success Rate:** 62.09%  
- **Cancellation Rate:** 37.91%  
- **Total Revenue (Successful Rides):** ₹35,080,467  
- **Top Revenue Vehicle:** Prime Sedan (₹5,224,050)

---

## 🛠 Tools Used

- Excel (Data Cleaning)
- MySQL (Business KPI Analysis)
- Power BI (Data Visualization & Reporting)

---

## 🗄 SQL Analysis

### Total Bookings
```sql
SELECT COUNT(*) AS total_bookings
FROM ola_rides;
```

### Success Rate
```sql
SELECT 
ROUND(
    SUM(CASE WHEN Booking_Status = 'Success' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2
) AS success_rate_percentage
FROM ola_rides;
```

### Cancellation Rate
```sql
SELECT 
ROUND(
    SUM(CASE 
        WHEN Booking_Status IN 
        ('Canceled by Driver', 'Canceled by Customer', 'Driver Not Found') 
        THEN 1 ELSE 0 END
    ) * 100.0 / COUNT(*), 2
) AS cancellation_rate_percentage
FROM ola_rides;
```

### Revenue by Vehicle Type
```sql
SELECT 
Vehicle_Type,
SUM(Booking_Value) AS total_revenue
FROM ola_rides
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY total_revenue DESC;
```

---

## 📊 Dashboard Preview

### 1️⃣ Overall Performance
![Overall Dashboard]([dashboard/dashboard_overall.png](https://github.com/analyst-mohit28/ola-data-analysis/blob/main/Overall.png))

---

### 2️⃣ Cancellation Analysis
![Cancellation Dashboard]([https://github.com/analyst-mohit28/ola-data-analysis/blob/main/Cancellation.png))

---

### 3️⃣ Vehicle Performance
![Vehicle Dashboard]([dashboard/dashboard_vehicle.png]([https://github.com/analyst-mohit28/ola-data-analysis/blob/main/Vehicle%20type%20Performance.png))

---

## 🔍 Key Insights

- Nearly **38% of bookings fail**, indicating significant operational inefficiencies.
- Prime Sedan generates the highest revenue among vehicle categories.
- Premium vehicles contribute disproportionately to total revenue.
- Driver-related cancellations represent a major operational gap.
- A small group of high-frequency customers contributes significantly to bookings.

---

## 💡 Business Recommendations

1. Reduce driver-related cancellations by improving vehicle availability checks.
2. Increase allocation of high-revenue vehicle types in high-demand areas.
3. Incentivize high-frequency customers through loyalty programs.
4. Improve cancellation tracking to reduce revenue leakage.

---

## 🚀 Conclusion

This project demonstrates structured KPI extraction, operational analysis, and business storytelling using SQL and Power BI.

It highlights how data-driven insights can improve ride fulfillment efficiency and revenue optimization.

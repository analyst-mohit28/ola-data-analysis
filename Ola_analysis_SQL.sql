# Retrieve all successful bookings 
SELECT * 
FROM ola.`bookings-100000-rows`
Where Booking_Status = "Success";

# Find all the average ride distance for each vehicle type
select Vehicle_Type, round(avg (Ride_Distance),2) as Avg_distance
from ola.`bookings-100000-rows`
group by Vehicle_Type

# Get the total number of cancel rides by Customers
Select count(*) 
from ola.`bookings-100000-rows`
where Booking_Status = "Canceled by Customer"

# list top 5 customers who booked the highest number of rides
Select Customer_ID, count(Booking_ID) as total_rides
from ola.`bookings-100000-rows`
Group By Customer_ID
Order by total_rides desc
Limit 5

# Get the number of rides canceled by due to personal or car-related issues
Select Count(*) 
From ola.`bookings-100000-rows`
where Canceled_Rides_by_Driver = "Personal & Car related issue"

# Find maximum and minimum ratings for prime Sedan bookings
Select max(Driver_Ratings) as max_rating, 
	min(Driver_Ratings) as min_rating
From ola.`bookings-100000-rows`
Where Vehicle_Type ="Prime Sedan"

# Retrive all the rides where payment was made using UPI
Select *
From ola.`bookings-100000-rows`
Where Payment_Method = "UPI"

# Find the average customer rating per vehicle type
Select Vehicle_Type, Round(AVG(Customer_Rating),2) as avg_customer_rating
From ola.`bookings-100000-rows`
Group By Vehicle_Type

# Calculate the total booking value of rides completed successfully
Select sum(Booking_Value) as total_successful_Ride_value
From ola.`bookings-100000-rows`
Where Booking_Status = "Success"

#List all incomplete rides along with the reason
Select Booking_ID, Incomplete_Rides_Reason
From ola.`bookings-100000-rows`
Where Incomplete_Rides = "Yes"





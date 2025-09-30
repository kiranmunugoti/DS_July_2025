# Show all the data in the restaurants table
SELECT * FROM restaurants;

#Show only the dishes, their prices, and the calories in them from the food_items table
SELECT item_name AS dish, price, calories 
FROM food_items;

#Retrieve the order ids, customer ids, and total prices of all orders
SELECT order_id, customer_id, total_price 
FROM orders;

#Count the number of restaurants in the restaurant table
SELECT COUNT(*) FROM restaurants;

#Find the unique number of cuisines served by the restaurants from the restaurants table
SELECT COUNT(DISTINCT cuisine) FROM restaurants;

# Find the number of unique dishes served by restaurants from the food_items table
SELECT COUNT(DISTINCT item_name) FROM food_items;

#Monthly revenue
SELECT * FROM orders LIMIT 10;
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
SUM(total_price) AS monthly_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month;

#Distribution by cuisine
SELECT * FROM orders LIMIT 10;
SELECT * FROM restaurants LIMIT 10;
SELECT 
  cuisine,
  COUNT(order_id) AS orders,
  SUM(total_price) AS revenue
FROM orders o
JOIN restaurants r ON o.order_id = r.restaurant_id
GROUP BY cuisine
ORDER BY revenue DESC;

#Montly average order value
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
AVG(total_price) AS avg_order_value
FROM orders
GROUP BY order_month
ORDER BY order_month;

#Restaurant performance
SELECT * FROM orders;
SELECT r.cuisine,
COUNT(o.order_id) AS total_orders,
SUM(o.total_price) AS total_revenue
FROM orders o
JOIN restaurants r ON o.order_id = r.restaurant_id
GROUP BY r.cuisine
ORDER BY total_revenue DESC;

#Average delivery time
SELECT * FROM ORDERS LIMIT 10;
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
AVG(TIMESTAMPDIFF(MINUTE, order_time, delivered_time)) AS avg_delivery_time
FROM orders
GROUP BY order_month
ORDER BY order_month;

#Orders made as per the item
SELECT * FROM restaurants;
select * from orders_items;
SELECT item_id, COUNT(order_id) AS total_orders
FROM orders_items
GROUP BY item_id
ORDER BY total_orders DESC;

#Total number of orders made for each item in a month
select * from orders_items;
select * from orders;
SELECT oi.item_id,
DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
COUNT(oi.order_id) AS total_orders
FROM orders_items oi
JOIN orders o ON oi.order_id = o.order_id
GROUP BY oi.item_id, order_month
ORDER BY order_month, total_orders DESC;

/*From all the respective queries and my obeservation I believe that the amount of average delivery time taken by the
restaurant is what making the business go down as the price is not listed.
As I also notice the total number of orders done for each order in a month is getting decreased and no item has been the top
seller in every month. */
# 1. 选出customers按名Z-A排序
SELECT cust_name
FROM Customers
ORDER BY cust_name DESC;

# 2. 选出Orders中顾客和订单号
SELECT cust_id,order_date
FROM Orders
ORDER BY cust_id,order_date DESC;

# 3.显示OrderItems表中的数量和价格（item_price），并按数量由多到少、价格由高到低排序。
SELECT order_num, order_item, quantity, item_price
FROM OrderItems
ORDER BY quantity DESC, item_price DESC;

SELECT order_num, order_item, quantity, item_price
FROM OrderItems
ORDER BY quantity * item_price DESC;

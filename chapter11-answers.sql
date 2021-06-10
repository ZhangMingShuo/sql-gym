# 1.在OrderItem表中查找哪些客户购买了价格为10美元以上的产品
SELECT *
FROM Customers
WHERE cust_id in (
    SELECT cust_id
    FROM OrderItems,
         Orders
    WHERE OrderItems.order_num = Orders.order_num
      and item_price >= 10
);

# 2.何人何时订购BR01

SELECT Orders.cust_id,Orders.order_date
FROM OrderItems,Orders
WHERE prod_id='BR01' and orderitems.order_num = Orders.order_num
ORDER BY order_date DESC;

# 3.
SELECT Orders.cust_id,Orders.order_date
FROM OrderItems,Orders
WHERE prod_id='BR01' and orderitems.order_num = Orders.order_num
ORDER BY order_date DESC;

SELECT cust_id
FROM Orders
WHERE order_num in (
    SELECT order_num
    FROM Orderitems
    WHERE prod_id = 'BR01'
);

# 4.
SELECT cust_email,cust_name
FROM Customers
WHERE cust_id in (
    SELECT cust_id
    FROM Orders
    WHERE order_num in (
        SELECT order_num
        FROM Orderitems
        WHERE prod_id='BR01'
        )
    );





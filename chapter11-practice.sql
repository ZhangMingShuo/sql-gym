# 11.2检索订购物品RGAN01的所有顾客的姓名，联系方式
# 1.
SELECT order_num
FROM OrderItems
WHERE  prod_id='RGAN01';

# 2.
SELECT cust_id
FROM  Orders
WHERE order_num = 20007 or order_num = 20008;

# 3.
SELECT *
FROM Customers
WHERE cust_id='1000000004' or cust_id = '1000000005';

# 4.
SELECT cust_id
FROM Orders
WHERE order_num IN (
    SELECT order_num
    FROM OrderItems
    WHERE prod_id = 'RGAN01'
    );

# 5.
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (
    SELECT cust_id
    FROM Orders
    WHERE order_num IN (
        SELECT order_num
        FROM OrderItems
        WHERE prod_id = 'RGAN01'
        )
    );

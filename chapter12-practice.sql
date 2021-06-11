
SELECT vend_name
FROM Vendors;

SELECT prod_name,prod_price,vend_id
FROM Products;

#笛卡儿积(cartesian product)
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products;

#内联结
SELECT vend_name, prod_name, prod_price
FROM vendors
INNER JOIN Products
    ON Vendors.vend_id = Products.vend_id;

SELECT vend_name, prod_name, prod_price
FROM Vendors, Products
WHERE Vendors.vend_id = Products.vend_id;

SELECT prod_name, vend_name, prod_price, quantity
FROM Products, OrderItems, Vendors
WHERE Products.vend_id = Vendors.vend_id
AND orderitems.prod_id = Products.prod_id
AND order_num = 20007;

# 优化子查询
# 11.5. 统计订购RGAN01的顾客列表
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

SELECT cust_name, cust_contact
FROM Customers,Orders,Orderitems
WHERE Customers.cust_id = Orders.cust_id
AND OrderItems.order_num = Orders.order_num
AND prod_id='RGAN01';
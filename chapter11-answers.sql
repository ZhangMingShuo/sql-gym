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

# 3.
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

# 5.
# 我们需要一个顾客ID列表，其中包含他们已订购的总金额。编写SQL语句，返回顾客ID（Orders表中的cust_id），
# 并使用子查询返回total_ordered以便返回每个顾客的订单总数。
# 将结果按金额从大到小排序
SELECT orders.cust_id,SUM(quantity*item_price) as cust_total
FROM OrderItems,Orders
WHERE Orders.order_num = Orderitems.order_num
GROUP BY orders.cust_id
ORDER BY cust_total DESC;

SELECT COUNT(cust_id),cust_id
FROM orders
GROUP BY cust_id;

SELECT B.cust,order_num,cust_total
FROM
(
    SELECT COUNT(A.cust_id) AS order_num,A.cust_id AS cust
    FROM Orders AS A
    GROUP BY A.cust_id
    ) AS B,(
    SELECT D.cust_id AS cust,SUM(C.quantity*C.item_price) as cust_total
    FROM OrderItems AS C,Orders AS D
    WHERE D.order_num = C.order_num
    GROUP BY D.cust_id
    ORDER BY cust_total DESC
) AS E
WHERE B.cust=E.cust
ORDER BY cust_total DESC;

# 5. 统计产品销售情况，统计每个产品销售总数
# 用联合查询的结果比子查询方法少了两行，子查询更全面一些

SELECT Products.prod_name ,SUM(OrderItems.quantity) AS quant_sold
FROM Products, OrderItems
WHERE Products.prod_id = OrderItems.prod_id
GROUP BY Products.prod_id
ORDER BY quant_sold DESC;


SELECT prod_name,
       (
           SELECT SUM(OrderItems.quantity) AS quant_sold
           FROM OrderItems
           WHERE OrderItems.prod_id = Products.prod_id
           ) AS quant_sold
FROM Products
ORDER BY quant_sold DESC;

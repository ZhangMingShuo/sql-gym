# 9.1聚集函数
# 返回products表中所有产品的平均价格
SELECT AVG(prod_price) AS avg_price
FROM Products;

SELECT *
FROM Products
WHERE vend_id='DLL01';

# 计算vend_id供应商id为'DLL01'所提供的产品的平均价格
SELECT AVG(prod_price) AS avg_price
FROM Products
WHERE vend_id='DLL01';

# 9.1.2 计算Customers 表中顾客总数
SELECT COUNT(*)
FROM Customers;

# 9.1.3 计算Products表中最贵物品的价格
SELECT MAX(prod_price) AS max_price
FROM Products;

# 9.1.4 计算Products表中最便宜物品的价格
SELECT MIN(prod_price) AS min_price
FROM Products;


SELECT *
FROM Orderitems
WHERE order_num LIKE '20005';

# 9.1.5 计算订购物品总数
SELECT SUM(quantity) AS items_ordered
FROM Orderitems
WHERE order_num=20005;

# 9.1.5 计算订单所有物品价钱之和
SELECT SUM(item_price*quantity) AS total_price
FROM Orderitems
WHERE order_num = 20005;

# 9.2聚集不同值
# 返回特定供应商提供的产品的平均价格。
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products
WHERE vend_id = 'DLL01';

# 9.3组合聚集 计算物品的数目，产品价格的最高值，最低值，平均值
SELECT COUNT(*) AS num_items,
       MIN(prod_price) AS price_min,
       MAX(prod_price) AS price_max,
       AVG(prod_price) AS price_avg
FROM Products;

# 9.5 1.编写SQL语句, 计算已经售出产品的总数
SELECT SUM(quantity)
FROM orderitems;

# 9.5.2 修改刚刚创建的语句，确定已经售出产品BR01的总数
SELECT SUM(quantity)
FROM orderitems
WHERE prod_id='BR01';

# 9.5.2 计算Products表中价格不超过10美元的最贵产品的价格(prod_price)。将计算所得的字段命名为max_price
SELECT MAX(prod_price)
FROM Products
WHERE not (prod_price > 10);
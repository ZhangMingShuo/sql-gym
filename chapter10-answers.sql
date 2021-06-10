# 供应商DLL0提供的产品数目
SELECT COUNT(*) AS num_prods
FROM Products
WHERE vend_id = 'DLL01';


# 计算所有供应商提供的产品数据
SELECT  vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;


# 题目1
SELECT order_num, COUNT(order_item) AS order_lines
FROM Orderitems
GROUP BY order_num
ORDER BY order_lines;


# 题目2
SELECT *
FROM Products;


SELECT COUNT(*) AS vendors_num
FROM Vendors;


SELECT vend_id, MIN(prod_price) AS cheapest_item
FROM Products
GROUP BY vend_id
ORDER BY cheapest_item;


# 题目3
SELECT order_num,SUM(quantity) AS nums
FROM OrderItems
GROUP BY order_num
having nums >= 100;


# 题目4
SELECT *
FROM OrderItems;


SELECT order_num, SUM(quantity*item_price) AS sum
FROM OrderItems
GROUP BY order_num
HAVING sum>=1000
ORDER BY sum;


# 题目5
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >=3
ORDER BY items, order_num;


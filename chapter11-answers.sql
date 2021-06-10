# 1.在OrderItem表中查找哪些客户购买了价格为10美元以上的产品
SELECT *
FROM Customers
WHERE cust_id in (
    SELECT cust_id
    FROM OrderItems,
         Orders
    WHERE OrderItems.order_num = Orders.order_num
      and item_price >= 10
)

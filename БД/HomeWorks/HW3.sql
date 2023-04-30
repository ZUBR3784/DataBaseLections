--  1 уровень сложности: 
-- (1) Назовите 5-7 типовых бизнес-процессов для платформы онлайн-стриминга
1.Трансляция
2.Донатинг
3.Коментарии
4.Реакции
5.Безопасность


-- В рамках БД "песочница" напишите следующие запросы:
-- (2) Вывести заказы клиентов не из USA.
 SELECT *
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
where Country!='USA'


-- (3) К товарам от 50 до 90 EUR применить постоянную скидку в 10%.
SELECT Products.ProductName,
   Products.Price* (1- 0.1)AS constant_discount_price FROM [Products]
where 	Price >= 50 and Price <= 90


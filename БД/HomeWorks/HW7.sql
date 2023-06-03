В рамках БД "песочница" напишите след/запросы


Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil.
COUNT(*) AS total_Orderts 
FROM [Orders]
join Shippers on Orders.ShipperID = Shippers.ShipperID
join Customers on Orders.CustomerID = Customers.CustomerID
where ShipperName ="Speedy Express" and Country ="Brazil"


На какую сумму было отправлено товаров клиентам в USA
SELECT 
sum(Quantity*Price) as sum_products_to_USA
FROM [OrderDetails]
join Orders on OrderDetails.OrderID = Orders.OrderID
join Customers on Orders.CustomerID = Customers.CustomerID
join Products on OrderDetails.ProductID = Products.ProductID
where Country ="USA"
 1 уровень сложности: В рамках БД "песочница" напишите след/запросы:

Задача. Вывести количественное распределение товаров по поставщикам (названиекомпании, ко-вотоваров)

-- SELECT SupplierName,
-- COUNT(*) AS total_Quantity
-- FROM Suppliers
-- JOIN Products ON Suppliers.SupplierID=Products.SupplierID
-- JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
-- GROUP BY SupplierName
-- ORDER BY total_Quantity DESC


Вывести категорию, где больше всего товаров (названиекатегории, ко-вотоваров)

-- FROM [Products]
-- join Categories on Products.CategoryID = Categories.CategoryID
-- join OrderDetails on Products.ProductID = OrderDetails.ProductID
-- ORDER BY Quantity DESC
-- LIMIT 1


Вывести сумму каждого заказа (номер_заказа, сумма)

-- SELECT 
-- OrderID, 
-- SUM(Quantity) AS total_Quantity
-- FROM OrderDetails
-- GROUP BY OrderID
-- ORDER BY total_Quantity DESC
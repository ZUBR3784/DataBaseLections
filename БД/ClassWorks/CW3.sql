-- # GenTech #3 / Apr 27, 2023

-- ### Что такое SQL
-- - Язык структурированных запросов (в СУБД/DBMS)

-- ### Отличие БД от СУБД
-- - **СУБД** - приложение (прикладное ПО)
-- - **БД** - данные, как таковые

-- ### Модели данных
-- - напр., реляционная (табличная)

-- ### Что такое CRUD?
-- - Create `INSERT INTO`
-- - Read `SELECT`
-- - Update `UPDATE`
-- - Delete `DELETE FROM`

-- ### Первичный ключ
-- - Поле для идентификации

-- **Свойства первичного ключа:**
-- - уникальность
-- - неизменяемость
-- - непустой

-- ```bash
-- ProductID

-- product_id

-- id
-- ```

-- ### Внешний ключ
-- - поле для **связывания** таблиц между собой


-- **Задача. Получил данные о товарах и их поставщиках**

-- ```sql
-- SELECT *
-- FROM Products
-- **JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID**
-- ```
 SELECT *
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.City
-- **Задача. Вывести информацию о товарах:**

-- - название_товара
-- - стоимость_товара
-- - название_категории
-- - описание_категории

-- ```sql
-- SELECT
-- 		Products.ProductName,
--     Products.Price,
--     Categories.CategoryName,
--     Categories.Description
-- FROM Products
-- **JOIN Categories ON Products.CategoryID=Categories.CategoryID**
-- ```

-- **Применить скидку в 7.5% к стоимости товара**

-- Products.Price * (1-.075) AS Price_discount,


-- **Задача. Вывести самый дорогой товар из категории `Beverages`**

-- ```sql
-- SELECT *
-- FROM Products
-- JOIN Categories ON Products.CategoryID=Categories.CategoryID
-- WHERE Categories.CategoryName='Beverages'
-- ORDER BY Price DESC
-- LIMIT 1
-- ```

-- **Задача. Вывести все заказы клиента `10`, которые повезет `Speedy Express`**

-- ```sql
-- SELECT *
-- FROM Orders
-- JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
-- WHERE
-- 		Orders.CustomerID=10
--     AND
--     Shippers.ShipperName='Speedy Express'
-- ```

-- **Задача. Вывести заказы клиентов из `USA`, `Germany`, `UK`**

-- - полное_имя_клиента
-- - страна_клиента
-- - полное_имя_менеджера

-- ```sql
-- SELECT 
-- 		Customers.CustomerName,
--     Customers.Country,
--     Employees.LastName,
--     Employees.FirstName
-- FROM Orders
-- JOIN Customers ON Orders.CustomerID=Customers.CustomerID
-- JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
-- WHERE Customers.Country IN ('USA', 'Germany', 'UK')
-- ```



SELECT*
FROM Suppliers
JOIN Products ON Suppliers.SupplierID=Products.SupplierID
JOIN OrderDetail ON Products.ProductID=OrderDetail.ProductID
-- **Задача. Вывести два самых дорогих напитка из `UK`**

-- ```sql
-- SELECT * 
-- FROM Products

-- JOIN Categories ON Products.CategoryID=Categories.CategoryID
-- JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

-- WHERE
-- 		Categories.CategoryName='Beverages'
-- 		AND
--     Suppliers.Country='UK'

-- ORDER BY Price DESC
-- LIMIT 2
-- ```

-- **Задача. Вывести страны-поставщики напитков**

-- ```sql
-- SELECT DISTINCT
-- 	Suppliers.Country
-- FROM Products

-- JOIN Categories ON Products.CategoryID=Categories.CategoryID
-- JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

-- WHERE Categories.CategoryName='Beverages'
-- ```

-- ### Виды ошибок

-- 1. Синтаксические
-- 2. Логико-алгоритмические
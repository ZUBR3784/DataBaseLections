 1 уровень сложности: В рамках БД "песочница":


Выполнить расчет З/П менеджеров за весь период заказов из расчета ставки в 10%
    SELECT 
    sum(Price*Quantity*.1) as payment_to_menager 
    FROM [OrderDetails]
    join Products on OrderDetails.ProductID = Products.ProductID

Вывести сотрудников, у которых ко-во заказов менее 20
    SELECT 
    Employees.FirstName,
    COUNT(*) AS total_orders
    FROM [Orders]
    join Employees on Orders.EmployeeID = Employees.EmployeeID
    group by Orders.EmployeeID
    HAVING total_orders <= 20
    ORDER BY total_orders DESC

Вывести названия компаний-перевозчиков и сколько заказов каждая из них доставила
    SELECT 
    ShipperName,
    count(*) as count_of_orders
    FROM [Orders]
    join Shippers on Orders.ShipperID = Shippers.ShipperID
    group by Shippers.ShipperID

Для клиентов из Mexico очистить контактные имена
    UPDATE Customers
    SET ContactName=''
    WHERE Country ="Mexico"

Описать связи между таблицами, напр., след. образом:
Orders.CustomerID (M:1) Customers.CustomerID
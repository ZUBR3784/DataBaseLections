-- 1 уровень сложности: В рамках БД "песочница" напишите след/запросы:

-- (1) У клиентов из China и USA очистить контактное_имя.

-- UPDATE Customers
-- SET ContactName=''
-- WHERE Country='China' or Country='USA'


-- (2) У товаров без категории с ценой от 20 EUR изменить цену на 10  
-- UPDATE Products
-- SET Price=10
-- WHERE CategoryID='null' AND Price>=20  


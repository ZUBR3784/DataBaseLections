-- (1) Приведите 5-10 типовых бизнес-процессов для любой предметной области (кроме интернет-магазина), а также их соответствие по CRUD.
-- 1.Тур-фирма
-- 2.Гостиничный бизнес
-- 3.Салон красоты
-- 4.Здравоохранение
-- 5.Агенство недвижимости 

-- В рамках БД "песочница"

-- (2) Вывести название и стоимость товаров от 20 EUR.
-- SELECT *FROM [Products]
-- where Price >= 20

-- (3) Вывести самый дорогой товар из категорий 5 и 8.
-- SELECT *FROM [Products]
-- where CategoryID in(5,8)
-- order by Price desc
-- limit 3

-- (4) Вывести название и стоимость самого дешевого товара в USD.
-- SELECT 	ProductName, 
-- 	Price as Price_usd
-- FROM [Products]
-- order by Price 
-- limit 3

-- (5) Вывести имена клиентов, кроме тех, что из UK и USA.
-- SELECT ContactName 
-- FROM [Customers]
-- where Country!='USA' and Country!='UK'
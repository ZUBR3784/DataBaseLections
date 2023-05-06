# GenTech #4 / May 4, 2023

```jsx
-- Вывести заказы клиентов не из USA

SELECT *
FROM [Orders]
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE Customers.Country!='USA'
```

```jsx
-- К товарам от 50 до 90 EUR применить **постоянную** скидку в 10%

UPDATE Products 
SET Price = Price * .9
WHERE Price BETWEEN 50 and 90
```

### Назначение оператора JOIN

Объединение таблиц (горизонтальное)

### Проекция (полей) в БД

Инструмент оптимизации запросов

```jsx
-- **Вывести страны-поставщики напитков**
SELECT DISTINCT
	Suppliers.Country
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE Categories.CategoryName='Beverages'
```

```jsx
SELECT * 
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE
		Categories.CategoryName='Beverages'
		AND
    Suppliers.Country='UK'

ORDER BY Price DESC
LIMIT 2
```

**Задача. Вывести 10 последних заказов**

```sql
SELECT * 
FROM Orders
ORDER BY OrderDate DESC
LIMIT 10
```

## Структура SQL

- `**DQL` (Data Query Language)**
    - `SELECT` - чтение
- `**DDL` (Data Definition Language)**
    - `CREATE` - создать объект (напр., БД, таблица и т.д.)
    - `DROP` - удалить
    - `ALTER` - изменить
    - `RENAME` - переименовать
- `**DML` (Data Manipulation Language)**
    - `INSERT INTO` - добавить записи
    - `UPDATE` - изменить записи
    - `DELETE` - удалить записи
- **`DCL` (Data Control Language)**
- **`TCL` (Transaction Control Language)**

## Создание БД

```sql
CREATE DATABASE db_name;
CREATE DATABASE IF NOT EXISTS db_name;
```

## Создание таблиц

```sql
CREATE TABLE <название_таблицы> (<структура>);
CREATE TABLE users (
	// название_поля тип_данных доп_хар-ки
	user_id int
);
```

## Основные типы данных в MySQL

- каждый столбец (поле) таблицы должен иметь указание на тип данных

### Числовые

- `int` / `integer`
- `decimal(x, y)`
    - `x` - ко-во цифр до запятой
    - `y` - ко-во цифр после запятой

### Строковые

- `varchar(x)`
    - `x` - макс. ко-во символов
- `text(x)`
    - `x` - макс. ко-во символов

### Логические

- `bool`

### Дата / время

- `datetime` / `timestamp`
- `date`
- `time`

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/db0257c4-5299-4338-b23b-189d57739f17/Untitled.png)

## Создание таблицы `users`

```sql
CREATE TABLE users(
  user_id int,
  created_at timestamp,
  country varchar(64),
  email varchar(64),
  is_blocked bool
 );
```

## Удаление таблиц

`DROP TABLE table_name`

`DROP TABLE IF EXISTS table_name`

### Табавить пользователя

```sql
INSERT INTO users (user_id, created_at, country, email, is_blocked)
VALUES
	(1, CURRENT_TIMESTAMP, NULL, NULL, false);
```

Создание остальных таблиц

```sql
CREATE TABLE reactions
(
    reaction_id int,
    created_at  timestamp,
    stream_id   int,
    value       int,
    author_id   int
);

CREATE TABLE streams
(
    stream_id  int,
    created_at timestamp,
    author_id  int,
    title      varchar(255),
		is_completed bool
);

CREATE TABLE donations
(
    donation_id int,
    created_at  timestamp,
    donator_id  int,
    amount      decimal(6, 2),
    stream_id   int
);
```

**Задача. Добавить три стрима в таблицу `streams`**

```sql
INSERT INTO streams(stream_id, created_at, author_id, title, is_completed)
VALUES
		(1, CURRENT_TIMESTAMP, 1, 'Stream from Germany', false),
    (2, CURRENT_TIMESTAMP, 1, 'Stream from France', false),
    (3, CURRENT_TIMESTAMP, 1, 'Stream from USA', false);
```

### Условная конструкция в SQL

Оператор `CASE`

**Пример. При чтении добавить поле `is_europe`**

```sql
SELECT *,
	CASE
    	WHEN Country IN ('Germany', 'France') THEN true
      ELSE false
  END AS is_europe
FROM Customers
```

**Пример. Вывести товары (со всеми полями), добавив новое `is_premium`**

`is_premium`

- цена от 150 - `true`
- остальные - `false`

```sql
SELECT *,
	CASE
	    	WHEN Price >= 150 THEN true
        ELSE false
  END AS is_premium
FROM Products
```

## Агрегация в SQL

Инструмент получения вычисленных данных

**Функции**

- `COUNT`() - подсчет строк

```sql
SELECT COUNT(*) AS total_users
FROM users;
```

```sql
SELECT
	COUNT(*) AS total_customers_from_usa
FROM Customers
WHERE Country='USA'
```

- `AVG()` - выч. сред/ариф. значение

```sql
SELECT AVG(Price) AS avg_price
FROM Products
```

- `MAX()` - вычисляет макс. значение
- `MIN()` - вычисляет минимальное. значение
- `SUM()` - вычисляет сумму

```sql
SELECT
		MIN(Price) AS min_price,
    MAX(Price) AS max_price,
    AVG(Price) AS avg_price,
    COUNT(*) AS total_products,
    SUM(Price) AS total_price
FROM Products
```

## Группировка в SQL

Оператор `GROUP BY`

**Пример. Количественное распределение клиентов по странам**

```sql
SELECT
		Country,
    COUNT(*) AS total
FROM Customers
GROUP BY Country
ORDER BY total DESC
```

**Задача. Вывести количественное распределение товаров по поставщикам**

```sql
SELECT 
	SupplierID,
	COUNT(*) as total_products
from Products
GROUP BY SupplierID
ORDER BY total_products desc
```

### Ссылки

- [Супер-песочница](https://sqliteonline.com/)
- [Как установить MySQL](https://timeweb.cloud/tutorials/mysql/kak-ustanovit-mysql-na-windows) - Windows
- [Как установить MySQL](https://vladster.net/ru/%D0%BA%D0%B0%D0%BA-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C-mysql-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80-%D0%BD%D0%B0-mac-os-x/) - Mac
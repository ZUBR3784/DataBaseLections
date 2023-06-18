# GenTech / Apr 6, 2023

https://western-appeal-39b.notion.site/GenTech-Apr-6-2023-60e43043dff9452696e21643064c3b54 - 1консп
https://western-appeal-39b.notion.site/GenTech-2-Apr-20-2023-4ee00436fced4fa1a6a12c6cbb0c5cf2  - 2консп
https://western-appeal-39b.notion.site/GenTech-3-Apr-27-2023-3863a21156f2457783d4f37c7f0385e1 - 3консп
https://western-appeal-39b.notion.site/GenTech-4-May-4-2023-7784c7284ea34b9389b91836d3e94ba0  - 4консп
https://western-appeal-39b.notion.site/GenTech-May-11-2023-2e2bd025831c4599b5107bb64729d2e3 - 5консп
https://western-appeal-39b.notion.site/GenTech-May-19-2023-b58e5953eed749c7868d2a052076cf3c  - 6консп
https://western-appeal-39b.notion.site/GenTech-May-25-2023-3ce6b4694cd94204b61700b60e8dd41f - 7консп
https://western-appeal-39b.notion.site/GenTech-Jun-1-2023-6e155fabc0b94466bbaab0f30c62e01a - 8консп

### Основная ресурсы
- [схема БД “игра: шахматы”](https://dbdiagram.io/d/6467c575dca9fb07c46a1047)
- [операторы SQL](https://www.sqltutorial.org/)
- [песочница] (https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all)
- [Супер-песочница](https://sqliteonline.com/)
- [Как установить MySQL](https://timeweb.cloud/tutorials/mysql/kak-ustanovit-mysql-na-windows) - Windows
- [Как установить MySQL](https://vladster.net/ru/%D0%BA%D0%B0%D0%BA-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C-mysql-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80-%D0%BD%D0%B0-mac-os-x/) - Mac
https://raw.githubusercontent.com/AndreiBakhtinov/GenTech/master/w3schools.sql - бд для тренировок
https://dbdiagram.io/d/6467c575dca9fb07c46a1047 - пом для напис БД и визуализации связей м-ду табл

## Тематические блоки (SQL)

    1. Теория БД
    2. CRUD
    3. DDL
    4. Типы данных
    5. Первичный и внешний ключи
    6. Агрегация (вкл. механизм группировки)
    7. Горизонтальное объедение таблиц (`JOIN`)
    8. Проектирование БД
    9. Работа с датой/временем
    10. Валидация данных (`SQL Constraints`)


Автоматизация бизнес-процесс

### Степени автоматизации
    - ручная обработка
    - автоматизированная
    - **автоматическая**

### Базовый состав типового проекта
    - `DB` - хранилище
    - `BE` - бизнес-логики
    - `FE` - интерфейс
        - Веб-сайты - человеко-чит.
        - Приложения - человеко-чит.
        - `API` - машино-чит.
    - `Deployment` - развертывание

### КЛИЕНТ-СЕРВЕРНАЯ АРХИТЕКТУРА
    По сути, схема “запрос-ответ”

**Роли:**
    - клиент (активная сторона) - выполняет запросы
    - сервер (пассивная сторона) - принимает запросы и обрабатывает их





### Базы данных

**БД (DB)** - структурированный набор данных, предназ. для автоматизированной обработки
    - фактически, представляет собой данные
    - цифровая копия сущностей (объектов) реального мира

**СУБД (DBMS, DataBase Management Software)** - прикладное ПО (приложение)
    - Система Управления Базой Данных

### Взаимодействие с СУБД (DBMS)
    `BE → DBMS (DB) →BE`

### Типы СУБД
    - Первичная (primary) - напр., `MySQL`
    - Вторичная (secondary) - напр., `Redis`

### Модели данных (БД)
    Это способ описания (хранения, структурированния) данных
        1. Реляционная (табличная) - напр., `MySQL`
        2. Документная (документ - ассоциативный массив) - напр., `MongoDB`
        3. Графовая (теория графов) - напр., `OrientDB`
        4. Плоская - напр., `Redis`

### Что такое SQL
    - Язык структурированных запросов (в СУБД/DBMS)

## Особенности реляционной модели данных
    1. Хранение в виде таблиц (строк и т.д.)
    2. Наличие связей между таблицами
    3. Позволяет хранить только скалярные значения (**скаляры**) - есть исключения (напр., `PostgreSQL`)
    4. Строгая схема описания данных (сперва необх. создать БД, таблицы и т.д.), включая типы данных

## Типы данных
- ограничение типа хранимых данных (напр., только дробное)
- **Примеры (SQL)**
    - `bool`
    - **`datetime`** / **`timestamp`**
    - `decimal(x, y)` - дробное (x-точность, y-масштаб)
        - `decimal(5, 2)`: `-999.99` - `999.99`

### Типы операций в СУБД
    - Чтение
    - Запись

### Категории операций в СУБД
    1. `CRUD` (
        - Create `INSERT INTO`
        - Read `SELECT`
        - Update `UPDATE`
        - Delete `DELETE FROM`)
    2. Aggregation (аналитика, итоги, статистика) - получение вычисленных данных



### Способы подключения к СУБД
    1. Из программного кода (BE) - целевой способ
    2. Из `GUI/CLI`-клиентов - вспомогательный способ

**Самая распространенная архитектура “ОДНА СУЩНОСТЬ - ОДНА ЗАПИСЬ”**

### Первичный ключ в БД (primary key)
    Это поле, которое однозначно идентифицирует каждую запись
        - уникальный
        - непустой
        - неизменяемый
        - варианты заполнения
            - авто-инкремент
            - уникальные значения (`UUID`)

### Внешний ключ (foreign key)
    - поле для **связывания** таблиц между собой




## Структура SQL

- `**DQL` (Data Query Language)**
    - `SELECT` - чтение
- `**DDL` (Data Definition Language)** - операторы определения БД
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

## Логические операторы (приоритеты - сверху вниз)
    1. `NOT`
    2. `AND`
    3. `OR`

## Основные типы данных в MySQL

- каждый столбец (поле) таблицы должен иметь указание на тип данных

### Числовые

- `int` / `integer`
- `decimal(x, y)`
    - `x` - общее ко-во цифр (точность)
    - `y` - ко-во цифр после запятой(масштаб)

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





## Агрегация в SQL
Инструмент получения вычисленных данных
**Функции**

- `COUNT`() - подсчет строк
- `AVG()` - выч. сред/ариф. значение
- `MAX()` - вычисляет макс. значение
- `MIN()` - вычисляет минимальное. значение
- `SUM()` - вычисляет сумму

        ```sql
    UPDATE Products
    SET
        ProductName=NULL,
        CategoryID=2
    WHERE
        Price BETWEEN 50 AND 60

    --
    UPDATE Products
    SET
        Price=Price * (1-.235)
    WHERE
        Price <= 50

    --
    SELECT
            COUNT(*) AS total_products,
            AVG(Price) AS avg_price
            MIN(Price) AS min_price,
        MAX(Price) AS max_price,
        SUM(Price) AS total_sum
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

## Фильтрация агрегированных данных / оператор `HAVING`
Оператор `HAVING` является аналогом `WHERE`, но предназначенных для фильтрации результатов агрегации
    ```sql
    SELECT
            Country,
        COUNT(*) AS total_customers

    FROM Customers

    GROUP BY Country
    HAVING total_customers >= 10

    ORDER BY total_customers DESC
    ```

## Валидация данных / SQL Constraints
    - `NOT NULL`
    - `UNIQUE`
    - `PRIMARY KEY (NOT NULL + UNIQUE)`
    - `FOREIGN KEY`
    - `DEFAULT`
        - `DEFAULT false`
        - `DEFAULT CURRENT_TIMESTAMP`
    - `CHECK`

## Проектирование БД

1. На одном сервере могут находиться **СУБД (DBMS)**
- **сетевой порт** - сетевой идентификатор процесса (программы)
1. В одной **СУБД** может находиться несколько **БД**
2. В одной **БД** может храниться несколько типов сущностей (объектов)
3. Стандартный подход: **ОДНА БД == ОДИН ПРОЕКТ**
4. Стандартный подход: **ОДНА СУЩНОСТЬ == ОДНА ЗАПИСЬ**

## Общие этапы проектирования БД

1. Анализ предметной обасти (бизнес-процессов)
2. Выделение сущностей и их свойств (характеристик)
3. Связывание сущностей между собой (установление связей)
    1. с помощью ключевых полей (`первичный` и `внешний` ключи)
4. Проверка решения (гипотезы)

## Первичный ключ (primary key)

- Является идентификатором каждой сущности

**Свойства**

- уникальный
- неизменяемый
- ненулевой

**Стандартные подходы к определению значения**

1. Авто-инкремент
2. Случайные значения (`UUID`, `GUID`, `ULID`)

## Унификация хранимых данных

Приведение к единому виду

- например, **номер телефона**

## Базовые виды связей между сущностями

- `1:1` (один к одному)
- `1:M` (один ко многим)
- `M:M` (многие ко многим)





                                        **Примеры**
### SQL: Update

Пример. Модификация профиля клиента

    ```sql
    UPDATE Customers
    SET PostalCode='0000000'
    WHERE CustomerID=1
    ```

**Задача. У всех пользователей не из `UK` очистить контактное имя**

    ```sql
    UPDATE Customers
    SET ContactName=''
    WHERE NOT Country='UK'
    ```

**Задача. У всех товаров от `50` до `60` (EUR) очистить `название` и установить `категорию 2`**

    ```sql
    UPDATE Products
    SET ProductName='',
        CategoryID=2
    WHERE Price BETWEEN 50 AND 60
    -- WHERE Price>=50 AND Price<=60
    ```

**Задача. У поставщиков из `USA` и `Japan` очистить почтовый индекс**

    ```sql
    UPDATE Suppliers
    SET PostalCode=''
    WHERE Country IN ('USA', 'Japan')
    ```

### SQL: Delete

Пример. Удаление клиента

    ```sql
    DELETE FROM Customers
    WHERE CustomerId=1
    ```

**Задача. Удалить сотрудников `1` и `2`**

    ```sql
    DELETE FROM Employees
    WHERE EmployeeID IN (1, 2)
    ```



### SQL: Create

Пример. Добавление нового клиента

    ```sql
    INSERT INTO Customers(CustomerName, ContactName, Address, City, PostalCode, Country)
    VALUES
    ('Ivanov Ivan', NULL, NULL, NULL, NULL, NULL);
    ```

**Задача. Добавить нового поставщика из `China`**

    ```sql
    INSERT INTO Suppliers(SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
    VALUES
    ('New supplier', NULL, NULL, NULL, NULL, 'China', NULL);
    ```

**Задача. Вывести всех поставщиков, у которых не указан `номер_телефона`**

    ```sql
    SELECT *
    FROM Suppliers
    WHERE Phone IS NULL
    ```

### Операторы `IS NULL` и `IS NOT NULL`

Проверка на **неопределенное значение**

**Пример**

    ```sql
    SELECT *
    FROM Suppliers
    WHERE Phone IS NOT NULL
    ```

**Задача. У товаров из категории `1` сделать поле `Unit` неопределенным**

    ```sql
    UPDATE Products
    SET Unit = NULL
    WHERE CategoryID=1
    ```

**Задача. Вывести самый дешевый товар у которого поле `Unit` неопределено**

    ```sql
    SELECT * 
    FROM Products
    WHERE Unit IS NULL
    ORDER BY Price
    LIMIT 1
    ```

### Внешний ключ
- поле для **связывания** таблиц между собой JOIN

### Назначение оператора JOIN
Объединение таблиц (горизонтальное)




**Задача. Получил данные о товарах и их поставщиках**

    ```sql
    SELECT *
    FROM Products
    **JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID**
    ```
 SELECT *
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.City
**Задача. Вывести информацию о товарах:**
    - название_товара
    - стоимость_товара
    - название_категории
    - описание_категории

    ```sql
    SELECT
            Products.ProductName,
        Products.Price,
        Categories.CategoryName,
        Categories.Description
    FROM Products
    **JOIN Categories ON Products.CategoryID=Categories.CategoryID**
    ```

**Применить скидку в 7.5% к стоимости товара**

Products.Price * (1-.075) AS Price_discount,


**Задача. Вывести самый дорогой товар из категории `Beverages`**

    ```sql
    SELECT *
    FROM Products
    JOIN Categories ON Products.CategoryID=Categories.CategoryID
    WHERE Categories.CategoryName='Beverages'
    ORDER BY Price DESC
    LIMIT 1
    ```

**Задача. Вывести все заказы клиента `10`, которые повезет `Speedy Express`**

    ```sql
    SELECT *
    FROM Orders
    JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
    WHERE
            Orders.CustomerID=10
        AND
        Shippers.ShipperName='Speedy Express'
```

**Задача. Вывести заказы клиентов из `USA`, `Germany`, `UK`**

- полное_имя_клиента
- страна_клиента
- полное_имя_менеджера

    ```sql
    SELECT 
            Customers.CustomerName,
        Customers.Country,
        Employees.LastName,
        Employees.FirstName
    FROM Orders
    JOIN Customers ON Orders.CustomerID=Customers.CustomerID
    JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
    WHERE Customers.Country IN ('USA', 'Germany', 'UK')
    ```


**Задача. Вывести два самых дорогих напитка из `UK`**

    ```sql
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

**Задача. Вывести страны-поставщики напитков**

    ```sql
    SELECT DISTINCT
        Suppliers.Country
    FROM Products

    JOIN Categories ON Products.CategoryID=Categories.CategoryID
    JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

    WHERE Categories.CategoryName='Beverages'
    ```


**Вывести заказы клиентов не из USA
    ```sql
    SELECT *
    FROM [Orders]
    JOIN Customers ON Orders.CustomerID=Customers.CustomerID
    WHERE Customers.Country!='USA'
    ```


К товарам от 50 до 90 EUR применить **постоянную** скидку в 10%
    ```sql
    UPDATE Products 
    SET Price = Price * .9
    WHERE Price BETWEEN 50 and 90
    ```



**Вывести страны-поставщики напитков**
    ```sql
    SELECT DISTINCT
        Suppliers.Country
    FROM Products

    JOIN Categories ON Products.CategoryID=Categories.CategoryID
    JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

    WHERE Categories.CategoryName='Beverages'
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
    - `x` - общее ко-во цифр (точность)
    - `y` - ко-во цифр после запятой(масштаб)

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

## Группировка в SQL оператором `GROUP BY`

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




**Задача. Вывести количественное распределение товаров по поставщикам (название_компании, ко-во_товаров)**
    ```sql
    SELECT 
        Suppliers.SupplierName, 
        COUNT(*) AS total_products
        
    FROM Products
        
    JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

    GROUP BY Suppliers.SupplierID

    ORDER BY total_products DESC
    ```

**Задача. Вывести категорию, где больше всего товаров (название_категории, ко-во_товаров)**
    ```sql
    SELECT 
        CategoryName,
        COUNT(*) AS total
    FROM Products

    JOIN Categories ON Products.CategoryID=Categories.CategoryID

    GROUP BY Categories.CategoryID
    ORDER BY total DESC

    LIMIT 1
    ```

**Задача. Вывести сумму каждого заказа (номер_заказа, сумма)**
    ```sql
    SELECT 
        OrderID,
        SUM(Products.Price * OrderDetails.Quantity) AS Total_Price

    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID=Products.ProductID

    GROUP BY OrderID
    ```

**Задача. Вывести информацию о последнем стриме (`название`)**
    ```sql
    SELECT
        title
    FROM streams
    ORDER BY created_at DESC
    LIMIT 1
    ```

**Задача. Дополнить вывод от предыдущей задачи `именем автора`**
    ```sql
    SELECT
        streams.title,
        **users.fullname**
    FROM streams

    **JOIN users ON streams.author_id=users.user_id**

    ORDER BY streams.created_at DESC
    LIMIT 1
    ```

## Добавление полей в существующую таблицу
    ```sql
    ALTER TABLE users
    ADD fullname varchar(64)
    ```

**Задача. Добавить трех пользователей (`Germany`, `France`, `USA`)**
    ```sql
    INSERT INTO users (user_id, created_at, country, email, is_blocked, fullname)
    VALUES
            (2, CURRENT_TIMESTAMP, 'Germany', NULL, false, 'Ivanov Petr'),
        (3, CURRENT_TIMESTAMP, 'France', NULL, false, 'Ivanov Misha'),
        (4, CURRENT_TIMESTAMP, 'USA', NULL, false, 'Ivanov Boris');
    ```

**Задача. Вывести кол. распределение пользователей по странам по убыванию**
    ```sql
    SELECT
        country,
        COUNT(*) AS total_users
    FROM users

    GROUP BY country

    ORDER BY total_users DESC
```

**Задача. Добавить пять реакций**
    ```sql
    INSERT INTO reactions(reaction_id, created_at, stream_id, value, author_id)
    VALUES
            (1, CURRENT_TIMESTAMP, 1, 5, 1),
        (2, CURRENT_TIMESTAMP, 2, 5, 2),
        (3, CURRENT_TIMESTAMP, 1, 3, 2),
        (4, CURRENT_TIMESTAMP, 1, 2, 3),
        (5, CURRENT_TIMESTAMP, 1, 4, 3);
    ```

**Задача. Вывести `страны` пользователей, кто поставил реакцию**
    ```sql
    SELECT DISTINCT
        users.country 
    FROM reactions

    JOIN users ON reactions.author_id=users.user_id
    ```

**Задача. Вывести информацию о последней реакции (`имя_автора_реакции`, `название_стрима`, `оценка`)
    ```sql
    SELECT
        users.fullname,
        streams.title,
        reactions.value
    FROM reactions

    JOIN users ON reactions.author_id=users.user_id
    JOIN streams ON reactions.stream_id=streams.stream_id

    ORDER BY reactions.created_at DESC
    LIMIT 1
    ```



## Валидация данных / SQL Constraints
    - `NOT NULL`
    - `UNIQUE`
    - `PRIMARY KEY (NOT NULL + UNIQUE)`
    - `FOREIGN KEY`
    - `DEFAULT`
    - `CHECK`

## Создание таблицы `students`
    ```sql
    CREATE TABLE students (
            student_id int PRIMARY KEY auto_increment,
        created_at timestamp DEFAULT current_timestamp,
        fullname varchar(64) NOT NULL,
        email varchar(64) UNIQUE
    );
```

## Создание таблицы `groups`
    ```sql
    CREATE TABLE `groups` (
            group_id int PRIMARY KEY auto_increment,
        created_at timestamp DEFAULT current_timestamp,
        name varchar(64) NOT NULL
    );
    ```

## Создание таблицы `student_attachments`
    ```sql
    CREATE TABLE students_attachments (
            student_attachment_id int PRIMARY KEY auto_increment,
        created_at timestamp DEFAULT current_timestamp,
            group_id int NOT NULL,
            student_id int NOT NULL,
        start timestamp default NULL,
        finish timestamp default NULL
    );
```
# GenTech / Jun 8, 2023

https://western-appeal-39b.notion.site/GenTech-Jun-8-2023-7e46fad99818427288b81b3d324d1bf2 - 1консп
https://western-appeal-39b.notion.site/GenTech-Jun-15-2023-5dbf45ed48734a848410b79c6a94f061 - 2консп
https://studio3t.com/download/ - скачать studio3t


**Справочная информация**

- [Схема БД “песочница: интернет-магазин”](https://dbdiagram.io/d/64820f46722eb77494a4f02d)
- как установить MongoDB
    - [Windows](https://timeweb.cloud/tutorials/mongodb/ustanovka-mongodb-na-raznye-os-windows-ubuntu-centos)
    - [Mac](https://www.imymac.com/ru/mac-tips/install-mongodb-mac.html)

## СУБД
    - MySQL
    - MongoDB

## GUI-клиент для подключения к СУБД
    - MySQL Workbench
    - Studio3T

## MongoDB: документо-ориентированная СУБД

**Принципиальные отличия MongoDB от `RDBMS`**
    1. Другой язык выполнения запросов (NoSQL - `Query API`)
    2. Модель данных - **ДОКУМЕНТНАЯ** (документ - ассоц/массив)
    3. Динамическая схема данных (без схемы, schemaless) - каждый документ может иметь свой набор полей
    4. Для хранения использует `JSON` и `Binary JSON` (`BSON`)
    5. Позволяет хранить вложенные структуры данных


## Базовые структуры данных (основные)
    - скаляр
        - `150`
        - `‘hello’`
    - массив
        - `[1, 2, 3]`
    - ассоц/массивы (карты)
    - множество

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d1ecc49a-5835-4372-b55e-75c262793482/Untitled.png)

## Масштабирование
    1. Горизонтальное (количество)
    2. Вертикальное (качество)

## MongoDB GUI Client

[Download Studio 3T for MongoDB | Windows, macOS & Linux](https://studio3t.com/download/)

## MongoDB: CRUD

**Create**
    - `insertOne()` добавить один документ
        - один аргумент
            - ассоц/массив (объект)
    - `insertMany()` добавить несколько документов
        - один аргумент
            - массив ассоц/массивов

**Read**
    - `findOne()`  найти (выбрать) один документ
    - `find()` найти (выбрать) несколько документов
        - аргументы
            - `filter`
            - `projection`
    - `countDocuments()` ко-во совпадений
        - аргументы
            - `filter`

**Update**
    - `updateOne()` изменить один документ
    - `updateMany()` изменить несколько документов
        - аргументы
            - `filter`
            - `action`

**Delete**
    - `deleteOne()` удалить один документ
    - `deleteMany()` удалить несколько документов
        - аргументы
            - `filter`

![Screenshot from 2023-06-08 22-41-46.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/022b6ab6-dde4-4543-8fdb-034bd0ec9fdd/Screenshot_from_2023-06-08_22-41-46.png)

**Пример. Добавление клиента**
```jsx
db.clients.insertOne({
    id: 'x888',
    name: 'Ivan Ivanov',
    country: 'USA'
})
```

**Пример. Вывести всех клиентов**
```jsx
db.clients.find()
```

**Пример. Вывести клиентов из `USA`**
```jsx
db.clients.find(
    {country: 'USA'} // filter
)
// с проекцией
db.clients.find(
    {country: 'USA'}, // filter
    {name: 1, _id: 0} // projection
)
```

**Пример. Вывести указанного клиента**
```jsx
db.clients.findOne(
    {id: 'x000'} // filter
)
```

**Пример. Вывести ко-во клиентов из `USA`**
```jsx
db.clients.countDocuments(
    {country: 'USA'} // filter
)
```

**Пример. Авторизация клиентов**
```jsx
db.clients.countDocuments(
    {
			email: 'user@example.org',
			password: '58hfgh20ghasdlfih433dasfasdfasef43',
			is_blocked: {$ne: true}
		} // filter
)
```

**Пример. Удалить клиентов из `China`**
```jsx
db.clients.deleteMany(
    {country: 'China'} // filter
)
```

## Базовые операторы модификации (`updateOne` / `updateMany()`)
    `$set` установить поля
    `$unset` удалить (снять) поля
    `$inc` инкремент полей (увеличить/уменьшить)
    `$mul` умножение

**Пример. Заблокировать клиентов `USA`**
```jsx
db.clients.updateMany(
    {country: 'USA'}, // filter
    { // action
        $set: {
            is_blocked: true
        }
    }
)
```

**Задача. Вывести имена заблокированных клиентов**
```jsx
db.clients.find(
    {is_blocked: true}, // filter
    {name: 1, _id: 0} // projection
)
```

**Задача. Вывести имена заблокированных клиентов из `USA`**
```jsx
db.clients.find(
    {
			is_blocked: true,
			country: 'USA'
		}, // filter
    {name: 1, _id: 0} // projection
)
```

**Пример. Добавить транзакцию**
```jsx
db.txs.insertOne({
    id: 't4943',
    created_at: new Date(),
    sender_id: 'x888',
    recipient_id: 'x000',
    amount: 100.5,
    currency: 'eur',
    comment: 'just for fun'
})
```

**Задача. Вывести информацию о всех транзакциях: `сумма` и `валюта`**
```jsx
db.txs.find(
    {}, // filter
    {amount: 1, currency: 1, _id: 0} // projection
)
```

## Операторы сравнения
    `$eq` равно (equal)
    `$ne` не равно (not equal)
    `$gt` больше (greater than)
    `$gte` больше или равно (greater than or equal)
    `$lt` меньше (less than)
    `$lte` меньше или равно (less than or equal)

**Пример. Вывести транзакции от `100` EUR (проекция: `сумма`)**
```jsx
db.txs.find(
    {
        currency: 'eur',
        amount: {$gte: 100}
    }, // filter
    {amount: 1, _id: 0} // projection
)
```

**Задача. Вывести `USD`-транзакции до `1000` (проекция: `сумма` и `комментарий`)**
```jsx
db.txs.find(
    {
        currency: 'usd',
        amount: {$lte: 1000}
    }, // filter
    {amount: 1, comment: 1, _id: 0} // projection
)
```

**Задача. Вывести `USD`-транзакции от `10` до `200` (проекция: `сумма` и `комментарий`)**
```jsx
db.txs.find(
    {
        currency: 'usd',
        amount: {
					$gte: 10,
					$lte: 200
				}
    }, // filter
    {amount: 1, comment: 1, _id: 0} // projection
)
```

**Задача. Разблокировать клиентов из `USA`**                                                                    
```jsx
db.clients.updateMany(
    {country: 'USA'}, // filter
    { // action
        $unset: {
            is_blocked: null
        }
    }
)
```

**Задача. Разблокировать клиентов не из `USA`**
```jsx
db.clients.updateMany(
	{country: {$ne: 'USA'}}, // filter
	{
		$unset: {
			is_blocked: null
		}
	} // action
)
```


**Задача. Вывести входящие звонки от клиента `c001` с продолжительностью от `5 мин`**

проекция: `id`, `created_at`, `duration_secs`

```jsx
db.calls.find(
    { // filter
        direction: 'in',
        client_id: 'c001',
        duration_secs: {$gte: 5*60}
    },
    {id: 1, created_at: 1, duration_secs: 1} // projection
)
```

**Задача. Вывести `входящие` звонки до `1 часа`**

```jsx
db.calls.find(
    { // filter
        direction: 'in',
        duration_secs: {$lte: 60*60}
    }
)
```

## Работа с массивами в MongoDB

**Базовые операторы работы с массивами**
    - `$push` добавить значение в **массив**
    - `$pull` удалить значение из массива
    - `$pullAll` удалить несколько значений из массива
    - `$addToSet` добавить значение в **множество**
    - `$each` добавить список значений в массив или множество

**Операторы сравнения при работе со списком значений**
    - `$in` принадлежность к списку значений
    - `$nin` (not in)

**Пример. Добавление значения в массив**
```jsx
// вар. 1
db.calls.updateMany(
    {}, // filter
    {
        $push: {
            topics: 'credit'
        }
    } // action
)

// вар. 2
db.calls.updateMany(
    {}, // filter
    {
        $addToSet: {
            topics: 'credit'
        }
    } // action
)
```

**Пример. Удалить значение из массива**
```jsx
db.calls.updateMany(
    {}, // filter
    {
        $pull: {
            topics: 'credit'
        }
    } // action
)
```

**Пример. Поиск по значению в массиве / Найти все разговоры по указанной теме**
```jsx
db.calls.find(
    {topics: 'super'} // filter
)
```

**Пример. Удалить несколько из массива**
```jsx
db.calls.updateMany(
    {}, // filter
    { // action
        $pullAll: {
            topics: ['money', 'vip']
        }
    }
)
```

**Пример. Добавить клиентов**
```jsx
db.clients.insertOne({
    id: 'c088',
    created_at: new Date(),
    fullname: 'Ivan Ivanov',
    country: 'Germany'
})

db.clients.insertOne({
    id: 'c087',
    created_at: new Date(),
    fullname: 'Petr',
    country: 'USA',
    is_blocked: true
})
```

**Пример. Вывести клиентов из `USA`**
```jsx
db.clients.find(
	{country: 'USA'}
)
```

**Пример. Вывести клиентов из `USA` и `Germany`**
```jsx
db.clients.find(
	{country: {$in: ['USA', 'Germany']}
)
```

**Задача. Вывести `незаблокированных` клиентов из `Germany`**
```jsx
db.clients.find(
	{
		country: 'Germany',
		is_blocked: {$ne: true}
	}
)
```

**Задача. Вывести `заблокированных` клиентов не из `USA` и не из `Germany`**
```jsx
db.clients.find(
	{
		is_blocked: true,
		country: {$nin: ['USA', 'Germany']}
	}
)
```

## Логические операторы
    - `$and`
    - `$or`
    - `$not`
    - `$nor` (НЕ ИЛИ) все указанные критерии не должны быть истинными

```jsx
// с неявным И
db.clients.find(
    {
        country: 'Germany',
        is_blocked: {$ne: true}
    }
)

// с явным И
db.clients.find(
    {
        $and: [
            {country: 'Germany'},
            {is_blocked: {$ne: true}}
        ]
    }
)
```

**Задача. Разблокировать всех клиентов из `Germany` и `USA`**

```jsx
db.clients.updateMany(
    {
        country: { $in: ['Germany', 'USA'] }
    },
    {
        $unset: {
            is_blocked: null
        }
    }
)
```

**Задача. Установить маркер “проверено” (`is_checked`) для звонков от 5 мин**
```jsx
db.calls.updateMany(
    {
        duration_secs: { $gte: 5 * 60 }
    },
    {
        $set: { is_checked: true }
    }
)
```

**Задача. Удалить тему `money` из всех звонков, которые имеют продолжительность до `1 часа` или `не проверены`**
```jsx
db.calls.updateMany(
    {
        $or: [
            { duration_secs: { $lte: 60 * 60 } },
            { is_checked: { $ne: true } }
        ]
    },
    {
        $pull: { topics: 'money' }
    }
)
```

**Задача. Установить маркер “проверено” (`is_checked`) и добавить тему `important` для звонков на темы `credit` или `money`**
```jsx
db.calls.updateMany(
    {
        topics: { $in: ['credit', 'money'] }
    },
    {
        $set: { is_checked: true },
        $addToSet: { topics: 'important' }
    }
)
```

**Задача. Вывести `темы` и `продолжительность` `непроверенных` звонков на темы `credit` или `money`**
```jsx
db.calls.find(
    {
        is_checked: { $ne: true },
        topics: { $in: ['credit', 'money'] }
    },
    { 'topics': 1, 'duration_secs': 1 }
)
```

**Задача. Вывести разговоры не на тему `money` от `1` до `60` мин**
```jsx
db.calls.find(
    {
        topics: { $ne: 'money' },
        duration_secs: {
            $gte: 1 * 60,
            $lte: 60 * 60
        }
    }
)
```

**Задача. Для всех `незаблокированных` клиентов не из `China` увеличить баланс (`balance`) на `200`**
```jsx
db.clients.updateMany(
    {
        country: { $ne: 'China' },
        is_blocked: { $ne: true }
    },
    {
        $inc: { balance: 200 }
    }
)
```

Добавить три пожертвования
    INSERT INTO donations(donation_id, created_at, donator_id, amount, stream_id)
    VALUES
        (1, CURRENT_TIMESTAMP, 1, 100.00, 1),
        (2, CURRENT_TIMESTAMP, 2, 200.00, 2),
        (3, CURRENT_TIMESTAMP, 1, 300.00, 4);


Вывести сумму всех пожертвований
    SELECT 
    SUM(donations.amount) as sum_of_donation
    FROM donations


Вывести информацию о пожертвованиях (имядоната, странадонатара, сумма)
    SELECT fullname,country,amount
    from donations
    JOIN users ON donations.donator_id = users.user_id 


Вывести ТОП-1 донаторов по сумме всех донатов (имядонатара, суммавсех_донатов)
    SELECT 
    fullname,
    SUM(amount)
    from donations
    JOIN users ON donations.donator_id = users.user_id 
    GROUP BY donator_id
    LIMIT 1


Вывести информацию о получателях донатов (имяпользователя, суммаполученных_донатов)
    SELECT author_id,sum(amount) AS sum_of_donates
    FROM donations
    join streams ON donations.stream_id = streams.stream_id
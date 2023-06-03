Опишите схему таблицу "расписание занятий"
    CREATE TABLE time_table(
    time_table_id int PRIMARY KEY auto_increment,
    name_subject varchar(64) NOT NULL,
    teacher_id int NOT NULL,
    group_id int NOT NULL,
    start_les datetime default NULL,
    finish_les datetime default NULL)

Опишите схему таблицы "преподаватели"
    CREATE TABLE teacher_id(
    teacher_id int PRIMARY KEY auto_increment,
    name_teacher varchar(64) NOT NULL,
    created_at timestamp DEFAULT current_timestamp,
    email varchar(64) UNIQUE)

Вывести имена студентов и названия групп, в которых они состоят
    SELECT 
    students.fullname as students_names,
    groups.name as name_group 
    FROM
    students_attachments
    JOIN students ON students_attachments.student_id = students.student_id
    JOIN groups ON students_attachments.group_id = groups.group_id
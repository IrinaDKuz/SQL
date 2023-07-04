CREATE TABLE public.students (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	created_on timestamp NOT NULL,
	CONSTRAINT students_email_key UNIQUE (email),
	CONSTRAINT students_pkey PRIMARY KEY (id)
);

-- Вывести все поля и все строки.
select * from students;

-- Вывести всех студентов в таблице
select distinct name from students;

-- Вывести только Id пользователей
select id from students
order by id asc;

-- Вывести только имя пользователей
select distinct name from students;

-- Вывести только email пользователей
select distinct email from students;

-- Вывести имя и email пользователей
select distinct name, email from students;

-- Вывести id, имя, email и дату создания пользователей
select id, name, email, created_on from students;

-- Вывести пользователей, где password 12333
select name, password  from students
where password = '12333';

-- Вывести пользователей, которые были созданы 2021-03-26 00:00:00
select name, created_on from students
where created_on = '2021-03-26 00:00:00';

-- Вывести пользователей, где в имени есть слово Анна
select name from students
where name LIKE '%Anna%';

-- Вывести пользователей, где в имени в конце есть 8
select name from students
where name LIKE '%8';

-- Вывести пользователей, где в имени в есть буква а
select name from students
where name LIKE '%a%';

-- Вывести пользователей, которые были созданы 2021-07-12 00:00:00
select name, created_on from students
where created_on = '2021-07-12 00:00:00';

-- Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313
select name, created_on, password from students
where created_on = '2021-07-12 00:00:00'
and password = '1m313';

-- Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey
select name, created_on from students
where created_on = '2021-07-12 00:00:00'
and name like '%Andrey%';

--  Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8
select name, created_on from students
where created_on = '2021-07-12 00:00:00'
and name like '%8%';

-- Вывести пользователей, у которых id равен 110
select name, id from students
where id = '110';

-- Вывести пользователей, у которых id равен 153
select name, id from students
where id = '153';

-- Вывести пользователей, у которых id больше 140
select name, id from students
where id > '140'
order by id asc;;

-- Вывести пользователей, у которых id меньше 130
select name, id from students
where id < '130'
order by id asc;

-- Вывести пользователей, у которых id меньше 127 или больше 188
select name, id from students
where id < 127 or id > 188
order by id asc;

-- Вывести пользователей, у которых id меньше либо равно 137
select name, id from students
where id <= 137
order by id asc;

-- Вывести пользователей, у которых id больше либо равно 137
select name, id from students
where id >= 137
order by id asc;

-- Вывести пользователей, у которых id больше 180, но меньше 190
select name, id from students
where id > 180 and id < 190
order by id asc;

-- Вывести пользователей, у которых id между 180 и 190
select name, id from students
where id between 180 and 190
order by id asc;

-- Вывести пользователей, где password равен 12333, 1m313, 123313
select name, password from students
where password in ('12333', '1m313', '123313');

-- Вывести пользователей, где created_on равен 2020-10-03 00:00:00,
-- 2021-05-19 00:00:00, 2021-03-26 00:00:00
select name, created_on from students
where created_on in ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

-- Вывести минимальный id 
select MIN(id) from students;

-- Вывести максимальный id 
select MAX(id) from students;

-- Вывести количество пользователей
select count(distinct name) AS unique_users_count
from students
WHERE name IS NOT NULL;

-- Вывести id пользователя, имя, дату создания пользователя.
-- Отсортировать по порядку возрастания даты добавления пользоватлеля.
select id, name, created_on from students
order by created_on asc;

-- Вывести id пользователя, имя, дату создания пользователя.
-- Отсортировать по порядку убывания даты добавления пользоватлеля.
select id, name, created_on from students
order by created_on desc;

/*
 * Таблица employees
 * Создать таблицу employees
 * - id. serial,  primary key,
 * - employee_name. Varchar(50), not null
 * Наполнить таблицу employee 70 строками.
 * */

create table employees (
id serial primary key,
employee_name varchar(50) not null
);

insert into employees (employee_name)
/* 
 * Запрос generate_series(1, 70) создает серию чисел от 1 до 70,
 * и для каждого числа выполняется вставка строки в таблицу "employees".
 * Оператор || используется для конкатенации строки "employee" с числом из серии
 */
select 'employee' || generate_series(1, 70);

select * from employees;

/*
 * Таблица salary
 * Создать таблицу salary
 * - id. Serial  primary key,
 * - monthly_salary. Int, not null
 * Наполнить таблицу salary 15 строками:
 * */

create table salary2( 
id serial primary key,
monthly_salary int not null
);

insert into salary2 (monthly_salary)
/* 
 * Запрос generate_series(0, 15) создает серию чисел от 0 до 15
 */
select 1000 + 100 * generate_series(0, 15);

select * from salary2;

/*
 * Таблица employee_salary
 * Создать таблицу employee_salary
 * - id. Serial  primary key,
 * - employee_id. Int, not null, unique
 * - salary_id. Int, not null
 * Наполнить таблицу employee_salary 40 строками:
 * - в 10 строк из 40 вставить несуществующие employee_id
 * */

create table employee_salary2 (
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

INSERT INTO employee_salary2(employee_id,salary_id)
values
(3,7),
(90,4),
(100,9),
(110,13),
(120,4),
(130,2),
(140,10),
(150,13),
(260,4),
(160,1),
(33,7),
(2,10),
(4,8),
(6,15),
(10,8),
(22,5),
(24,9),
(27,6),
(28,11),
(31,12),
(25,6),
(35,11),
(18,14),
(37,11),
(68,15),
(53,11),
(44,8),
(63,13),
(51,10),
(47,7),
(39,8),
(34,7),
(55,8),
(21,11),
(66,11),
(58,7),
(14,10),
(61,7),
(50,5),
(67,2),
(49,5);

select * from employee_salary2;

/* 
 * Таблица roles
 * Создать таблицу roles
 * - id. Serial  primary key,
 * - role_name. int, not null, unique
 * Поменять тип столба role_name с int на varchar(30)
 * Наполнить таблицу roles 20 строками:
 * */

create table roles2( 
id serial primary key,
role_name int not null unique
);

alter table roles2 
alter column role_name type varchar(50);

INSERT INTO roles2(role_name)
VALUES('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

select * from roles2;

/*
 * Таблица roles_employee
 * Создать таблицу roles_employee
 * - id. Serial  primary key,
 * - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
 * - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
 * Наполнить таблицу roles_employee 40 строками:
 * */


create table roles_employee (
id serial primary key,
employee_id int not null unique,
foreign key (employee_id) references employees(id),
role_id int not null,
foreign key (role_id) references roles2(id)
);

INSERT INTO roles_employee(employee_id,role_id)
VALUES(7,2),
(20,4),
(3,9),
(5,13),
(23,4),
(11,2),
(10,9),
(22,13),
(21,3),
(34,4),
(6,7),
(4,15),
(9,8),
(13,1),
(14,5),
(15,9),
(18,11),
(19,20),
(24,15),
(25,17),
(27,14),
(29,12),
(30,11),
(37,10),
(38,13),
(41,16),
(44,18),
(47,19),
(51,4),
(52,6),
(53,8),
(60,9),
(54,10),
(63,9),
(65,1),
(57,3),
(67,8),
(69,11),
(70,9),
(55,10);

select * from roles_employee;
   		
/* Удалить таблицу */
drop table salary;

/* Удалить данные из таблицы */
delete from salary
where id > 15;

/* Перезаписать данные в таблице */
update salary
set monthly_salary = 1000;

update salary 
set monthly_salary = 1450
where id = 5;

/* Вывод данных: */
select role_title, monthly_salary from roles_salary
join roles on roles_salary.id_role = roles.id
join salary on roles_salary.id_salary = salary.id;

/* Вывод данных. Сортировка по возрастанию */
select * from salary
order by id;	

/* Добавить колонку: */
alter table roles
add column parking int;

/* Переименовать колонку: */
alter table roles
rename column parking to taxi;

/* Удалить колонку: */
alter table roles
drop column taxi;

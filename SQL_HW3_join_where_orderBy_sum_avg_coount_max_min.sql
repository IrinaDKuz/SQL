--  1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from
employees join employee_salary2 on
employees.id  = employee_id 
join salary2 on
salary2.id  = salary_id; 

--  2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from
employees join employee_salary2 on
employees.id  = employee_id 
join salary2 on
salary2.id  = salary_id
where monthly_salary < 2000; 

--  3. Вывести все зарплатные позиции, но работник по ним не назначен.
-- (ЗП есть, но не понятно, кто её получает.)
select employee_name, monthly_salary from
employees join employee_salary2 on
employees.id  = employee_id 
full join salary2 on
salary2.id  = salary_id
where employee_name is NULL; 

--  4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен.
-- (ЗП есть, но не понятно кто её получает.)
select distinct employee_name, monthly_salary from
employees join employee_salary2 on
employees.id  = employee_id 
full join salary2 on
salary2.id  = salary_id
where employee_name is null and monthly_salary < 2000;

--  5. Найти всех работников, кому не начислена ЗП.
select distinct employee_name, monthly_salary from
employees full join employee_salary2 on
employees.id  = employee_id 
full join salary2 on
salary2.id  = salary_id
where monthly_salary is NULL;

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from
employees join roles_employee on
employees.id  = employee_id
join roles2 on
roles2.id  = role_id
order by employee_name;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from
employees join roles_employee on
employees.id  = employee_id
join roles2 on
roles2.id  = role_id
where role_name like '%Java developer%';

 -- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from
employees join roles_employee on
employees.id  = employee_id
join roles2 on
roles2.id  = role_id
where role_name like '%Python developer%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from
employees join roles_employee on
employees.id  = employee_id
join roles2 on
roles2.id  = role_id
where role_name like '%QA engineer%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from
employees join roles_employee on
employees.id  = employee_id
join roles2 on
roles2.id  = role_id
where role_name like '%Manual QA engineer%';

-- 11. Вывести имена и должность автоматизаторов QA.
select employee_name, role_name from
employees join roles_employee on
employees.id  = employee_id
join roles2 on
roles2.id  = role_id
where role_name like '%Automation QA engineer%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary, role_name from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like '%Junior%'
order by monthly_salary;

--  13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like '%Middle%'
order by monthly_salary;

--   14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary, role_name from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like '%Senior%'
order by monthly_salary;

-- 15. Вывести зарплаты Java разработчиков
select employee_name, role_name, monthly_salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like '%Java developer'
order by monthly_salary;

-- 16. Вывести зарплаты Python разработчиков
select employee_name, role_name, monthly_salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like '%Python developer'
order by monthly_salary;

--  17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name = 'Junior Python developer'
order by monthly_salary;

--  18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, monthly_salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name = 'Middle JavaScript developer'
order by monthly_salary;

--  19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name = 'Senior Java developer'
order by monthly_salary;

--  20. Вывести зарплаты Junior QA инженеров
select employee_name, role_name, monthly_salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like'Junior % QA engineer'
order by monthly_salary;

--  21. Вывести среднюю зарплату всех Junior специалистов
select AVG(monthly_salary) as Jun_Avg_Salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like'Junior %';


--  22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary) as JS_SUM_Salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like'%JavaScript developer';

--  23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary) as QA_MIN_Salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like '%QA engineer';

--  24. Вывести максимальную ЗП QA инженеров
select MAX(monthly_salary) as QA_MIN_Salary from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
join salary2 on
salary2.id = id_salary
where role_name like '%QA engineer';

--  25. Вывести количество QA инженеров
select COUNT(employee_name) as QA_COUNT from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
where role_name like '%QA engineer';

--  26. Вывести количество Middle специалистов.
select COUNT(employee_name) as middle_COUNT from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
where role_name like '%Middle%';

--  27. Вывести количество разработчиков
select COUNT(employee_name) as dev_COUNT from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
where role_name like '%developer%';

--  28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary) from
roles2 join roles_employee on
roles2.id = role_id
join employees on
employees.id  = employee_id
join roles_salary on
role_id = id_role
full join salary2 on
salary2.id = id_salary
where role_name like '%developer%';

--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from
roles2
 join roles_salary on
roles2.id  = id_role
 join salary2 on
salary2.id = id_salary
join employee_salary2 on
salary_id = id_salary
right join employees on
employees.id = employee_id
order by employee_name;

--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов, у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from
roles2
 join roles_salary on
roles2.id  = id_role
 join salary2 on
salary2.id = id_salary
join employee_salary2 on
salary_id = id_salary
right join employees on
employees.id = employee_id
where monthly_salary between 1700 and 2300
order by employee_name;

--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов, у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from
roles2
 join roles_salary on
roles2.id  = id_role
 join salary2 on
salary2.id = id_salary
join employee_salary2 on
salary_id = id_salary
right join employees on
employees.id = employee_id
where monthly_salary < 2300
order by employee_name;

--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов, у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from
roles2
 join roles_salary on
roles2.id  = id_role
 join salary2 on
salary2.id = id_salary
join employee_salary2 on
salary_id = id_salary
right join employees on
employees.id = employee_id
where monthly_salary in (1100, 1500, 2000)
order by employee_name;

-- creating our database
create database appclick;

-- use database
use appclick;

-- create table
create table staff(
staff_id int,
staffname varchar(50),
gender char(6),
Departments varchar(20),
hire_date date,
salary decimal(10, 2),
primary key(staff_id)
);

select *from staff;

-- insert values into table staff
insert into staff values(1,'John Paul','Male','Developer','2022-11-25',456788);
insert into staff values(2,'Mary Paul','Female','HR','2023-11-25',2256788.29);


-- Table 2: Creating table students
create table students(
studentid int,
`student name` varchar(30),
course char(30),
age int,
height float,
study_mode varchar(30),
staff_id int,
primary key(studentid),
foreign key(staff_id) references staff(staff_id)
);

select *from students;

-- Classwork
/*create a table named tutors with the colums(tutorid,name,age,course,salary,
city) add a primary key and a foreign key in the table*/

/*INTRODUCING CONSTRAINTS TO OUR DATABASE
1. Auto-increment
2. Not null
3. Unique
4. Check
5. Default
6. Enum*/


-- create table with constraints
create table Employees(
Emp_id int auto_increment,
first_name varchar(30),
lastname char(30),
age int,
gender enum('Male', 'Female'),
hiredate date,

primary key(emp_id),
check(age>=25));

select *from employees;

insert into employees values(1,'Rebeccah','Olaniyi',25,'Female','2024-01-01');
insert into employees(first_name,lastname,age,gender,hiredate) values
('John','Eze',26,'Male','2024-12-23');

insert into employees(first_name,lastname,age,gender,hiredate) values
('Gafar','Idris',null,'Male','2024-01-20'),
('Ibukun','Ayoola',28,'Female','2023-12-30'),
('Pius','Grace',26,'Female','2022-09-30');


-- Unique, Notnull, default
create table Customers(
customer_id int,
customer_name varchar(30) not null,
Gender varchar(10),
productcategory char(20) unique,
customercity varchar(40) default 'Ibadan',
amount int,
phone bigint,
emp_id int,

primary key(customer_id),
foreign key(emp_id) references employees(emp_id));

select *from cust_table;

insert into customers values(11,'James','Female','Grocries','Enugu',500,82367367,2);
insert into customers values(12,'James','Male','Fruits','Enugu',500,82367367,2);

insert into customers(Customer_id,customer_name,Gender,productcategory,amount,phone,
emp_id) values(13,'Mariam','Female','Biscuits',1000,8765432,3);

-- MODIFYING AND EDITING OUR DATABASE
-- 1. Renaming table or database
alter table customers rename to cust_table;

-- adding an extra column
alter table employees
add column email varchar(30);

select *from employees;

update employees
set email = 'rebeccah@employes'
where emp_id =1;

-- same thing for everyone
update employees
set email = 'employes@gmail.com'
where emp_id;

-- change existing values
update employees
set first_name = 'Rebe'
where emp_id =1;

-- delete 
alter table employees
drop column email;

select *from employees;

-- modifying data structures
alter table cust_table
modify amount varchar(200);

insert into cust_table(Customer_id,customer_name,Gender,productcategory,amount,phone,
emp_id) values(14,'Mariam','Female','Pastries','one thousand',8765432,3);

select *from cust_table;

-- adding constraints
alter table staff
modify gender enum('Male', 'Female');

insert into staff values(3,'Mary Paul','LGBTQ','HR','2023-11-25',2256788.29);

-- deleting contents
select *from cust_table;

truncate table cust_table;

drop table cust_table;

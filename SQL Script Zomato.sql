Create database Zomato_Project;
use zomato_project;
Create table Dept (deptno int primary key, dname varchar(20), loc varchar(10));
Create table Employee( empno int primary key, ename varchar(50), job varchar(50) default 'Clerk',  mgr int, 
     hiredate date, Salary decimal(10, 2) check (Salary > 0), comm decimal(10, 2), deptno int,                    
    CONSTRAINT fk_Dept FOREIGN KEY (deptno) REFERENCES Dept(deptno));
    select * from dept;
    select * from Employee;
   insert into Dept(deptno, dname, Loc) values (10, 'OPERATIONS', 'BOSTON'), (20, 'RESEARCH', 'DALLAS'), (30, 'SALES', 'CHICAGO'),(40, 'ACCOUNTING', 'NEW YORK');
   insert into Employee (empno, ename, mgr, hiredate, Salary, comm, deptno) values (7369, 'SMITH', 7902, '1890-12-17', 800, NULL, 20);
   insert into Employee (empno, ename, job, mgr, hiredate, Salary, comm, deptno) values (7499, 'ALLEN', 'SALESMAN', '7698', '1981-02-20', 1600, 300, 30);
   insert into Employee (empno, ename, job, mgr, hiredate, Salary, comm, deptno) values
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-20', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30);
insert into Employee (empno, ename, mgr, hiredate, Salary, comm, deptno) values
(7876, 'ADAMS', 7788, '1987-05-23', 1100.00, NULL, 20),
(7900, 'JAMES', 7698, '1981-12-03', 950.00, NULL, 30);
insert into Employee (empno, ename, job, mgr, hiredate, Salary, comm, deptno) values
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);

-- Q no 3 --
select ename, Salary from employee where Salary > 1000;

-- Q no 4 --
select * from employee where hiredate < '1981-10-01';

-- Q no 5 --
select ename from employee where ename like '_I%';

-- Q no 6 --
select ename as Employee_Name, Salary, (Salary*0.4) as Allowance, (Salary*0.1) as PF, Salary + (Salary*0.4)-(Salary*0.1) as Net_salary from Employee;

-- Q no 7 --
Select ename, job from employee where mgr is null;

-- Q no 8 --
select empno, ename, Salary from employee order by Salary asc;

CREATE TABLE salespeople (snum INT, sname VARCHAR(50), city VARCHAR(50), comm DECIMAL(4, 2));
INSERT INTO salespeople (snum, sname, city, comm) VALUES
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'San Jose', 0.13),
(1003, 'Axelrod', 'New York', 0.10),
(1004, 'Motika', 'London', 0.11),
(1007, 'Rafkin', 'Barcelona', 0.15);
INSERT INTO salespeople (snum, sname, city, comm) VALUES (NULL, NULL, NULL, NULL);
CREATE TABLE customers (cnum INT, cname VARCHAR(50), city VARCHAR(50), rating INT, snum INT);
INSERT INTO customers (cnum, cname, city, rating, snum) VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanne', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 300, 1002),
(2004, 'Grass', 'Berlin', 100, 1002),
(2006, 'Clemens', 'London', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004),
(2008, 'James', 'London', 200, 1007),
(NULL, NULL, NULL, NULL, NULL);
CREATE TABLE orders (onum INT, amt DECIMAL(10, 2), odate DATE, cnum INT, snum INT);
INSERT INTO orders (onum, amt, odate, cnum, snum) VALUES
(3001, 18.69, '1994-10-03', 2008, 1007),
(3002, 1900.10, '1994-10-03', 2007, 1004),
(3003, 767.19, '1994-10-03', 2001, 1001),
(3005, 5160.45, '1994-10-03', 2003, 1002),
(3006, 1098.16, '1994-10-04', 2008, 1007),
(3007, 75.75, '1994-10-05', 2004, 1002),
(3008, 4723.00, '1994-10-05', 2006, 1001),
(3009, 1713.23, '1994-10-04', 2002, 1003),
(3010, 1309.95, '1994-10-06', 2004, 1002),
(3011, 9891.88, '1994-10-06', 2006, 1001),
(NULL, NULL, NULL, NULL, NULL);
select * from salespeople;
select * from customers;
select * from orders;

-- Q no 4.
Select
    s.snum as salespeople_ID, 
    s.sname as salespeople_Name, 
    s.city as city, 
    c.cnum as customer_ID, 
    c.cname as customer_Name
from
    salespeople s
Join
    customers c
On
    s.city = c.city;
    
    -- Q no 5
    select
    c.cname as customer_Name, 
    s.sname as salespeople_Name
from 
    customers c
join
    salespeople s
on
    c.snum = s.snum;
    
    -- Q no 6
    select 
    o.onum as order_Number,
    c.cname as customer_Name,
    c.city as customer_City,
    s.sname as salespeople_Name,
    s.city as salespeople_City,
    o.amt as order_Amount
from
    orders o
join
    customers c 
on
    o.cnum = c.cnum
join
    salespeople s 
on
    o.snum = s.snum
where
    c.city <> s.city;
    
    -- Q no 7 
    
    select
    o.onum as order_Number, 
    c.cname as customer_Name
from
    orders o
join
    customers c 
on
    o.cnum = c.cnum;
-- Q no 8

SELECT 
    c1.cname as customer1_Name, 
    c2.cname as customer2_Name, 
    c1.rating as rating
from
    customers c1
join
    customers c2
on
    c1.rating = c2.rating
where
    c1.cnum < c2.cnum;
    -- Q no 9
    
    select
    c1.cname as customer1_Name, 
    c2.cname as customer2_Name, 
    s.sname as salespeople_Name
from
    customers c1
join
    customers c2
on
    c1.snum = c2.snum 
    and c1.cnum < c2.cnum
join
    salespeople s
on
    c1.snum = s.snum;
    -- Q no.10
    
    select
    s1.sname as Salespeople1_Name, 
    s2.sname as Salespeople2_Name, 
    s1.city as City
from
    salespeople s1
join
    salespeople s2
on
    s1.city = s2.city 
    and
    s1.snum < s2.snum;




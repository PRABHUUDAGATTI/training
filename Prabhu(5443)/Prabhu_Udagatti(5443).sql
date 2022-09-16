 CREATE DATABASE ORG;
USE ORG;

drop table worker

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY Identity,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY numeric(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);



INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES ( 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR');
		INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES( 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin');
	INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES ( 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR');
	INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES ('Ahhmitabh', 'Siggngh', 2500000, '2014-02-20 09:00:00', 'Admin');
		INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin')
				INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES ( 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account')
		INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES( 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account')
		INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES ( 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');



CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT numeric(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(1, 5000, '2016-02-20'),
		(2, 3000, '2016-06-11'),
		(3, 4000, '2016-02-20'),
		(1, 4500, '2016-02-20'),
		(2, 3500, '2016-06-11');

select * from Bonus

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (1, 'Manager', '2016-02-20 00:00:00'),
 (2, 'Executive', '2016-06-11 00:00:00'),
 (8, 'Executive', '2016-06-11 00:00:00'),
 (5, 'Manager', '2016-06-11 00:00:00'),
 (4, 'Asst. Manager', '2016-06-11 00:00:00'),
 (7, 'Executive', '2016-06-11 00:00:00'),
 (6, 'Lead', '2016-06-11 00:00:00'),
 (3, 'Lead', '2016-06-11 00:00:00');

 select * from Worker
 select * from Bonus
 select * from Title

 /* 1)Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.*/

 select FIRST_NAME as WORKER_NAME  from Worker;


 /*Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.*/

 select upper(FIRST_NAME) from Worker


 /* Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table. */

 select DEPARTMENT from Worker
 group by DEPARTMENT

 /* Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.*/
 
 select SUBSTRING(FIRST_NAME,1,3) from Worker;

 /*Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table. */

 select CHARINDEX('a',FIRST_NAME) from Worker
 where FIRST_NAME='Amitabh'
 
 /* Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.*/

 select RTRIM(FIRST_NAME) from Worker

/* Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.*/

select LTRIM(DEPARTMENT) from Worker

/*Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.*/

 select DEPARTMENT, len(DEPARTMENT) as Total_len from Worker
 group by DEPARTMENT 

 /*Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.*/

 select REPLACE(first_name,'a','A') from worker;

 /*Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.*/

 select concat(FIRST_NAME,LAST_NAME) as COMPLETE_NAME from Worker

 /*Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending*/

 SELECT * FROM Worker
 ORDER BY FIRST_NAME

 /*Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.*/

  SELECT * FROM Worker
 ORDER BY FIRST_NAME,DEPARTMENT DESC

/* Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table..*/

select * from Worker
where FIRST_NAME in('Vipul','Satish')

/* Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.*/

select * from Worker
where FIRST_NAME not in('Vipul','Satish')

/* Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.*/

select * from Worker
where DEPARTMENT='Admin'

/* Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.*/

select * from Worker
where FIRST_NAME like '%a%'

/* Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.*/

select * from Worker
where FIRST_NAME like '%a'

/*Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.*/

select * from Worker
where len(first_name)=6 and first_name like '%h';

/*Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.*/

select * from Worker
where SALARY between 100000 and 500000;

/*Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.*/

select * from Worker
where year(JOINING_DATE)=2014 and MONTH(joining_date)=2

/*Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.*/

select count(department) from Worker
where DEPARTMENT='Admin'

/*Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.*/

select FIRST_NAME,LAST_NAME from Worker
where SALARY between 50000 and 100000;

/*Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.*/

select department,count(department) as c from Worker
group by DEPARTMENT
order by 2 desc

/*Q-24. Write an SQL query to print details of the Workers who are also Managers.*/

select * from Worker,Title
where Worker.WORKER_ID=Title.WORKER_REF_ID and Title.WORKER_TITLE='Manager'

/*Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.*/

select WORKER_TITLE,AFFECTED_FROM, count(*) from Title
group by AFFECTED_FROM,WORKER_TITLE
having count(*)>1

/*Q-26. Write an SQL query to show only odd rows from a table.*/

select * from Worker
where WORKER_ID%2 != 0;

/*Q-27. Write an SQL query to show only even rows from a table.*/

select * from Worker
where WORKER_ID%2 = 0;

/*Q-28. Write an SQL query to clone a new table from another table*/

select * into worker1  FROM Worker;

/*Q-29. Write an SQL query to fetch intersecting records of two tables.*/

select * from Worker intersect select * from worker1

/*Q-30. Write an SQL query to show records from one table that another table does not have.*/

select * from Worker1
where WORKER_ID not in (select WORKER_ID  from worker)

/*Q-31 Write an SQL query to show the top n (say 10) records of a table.*/ 

select top 5  * from Worker

/*Q-32 Write an SQL query to determine the 5th highest salary without using TOP or limit method. */ 

select max(salary) from worker
     where salary<(     select max(salary) from worker
     where salary<(select max(salary) from worker
     where salary<(select max(salary) from worker
     where salary<(select max(salary) from worker)))) 


/*Q-33 Write an SQL query to print the name of employees having the highest salary in each department.*/  
select * from Worker
where SALARY in (select max(salary) from Worker group by DEPARTMENT)

/*Q-34 Write an SQL query to fetch three max salaries from a table. */

select distinct top 3 SALARY from Worker
order by SALARY desc

/*Q-35 Write an SQL query to show all departments along with the number of people in there.*/

select DEPARTMENT,count(*) as total_no_wo from Worker
group by department





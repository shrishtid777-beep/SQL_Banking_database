use banking_db;
 create table company(
 emp_id int primary key ,
 emp_name varchar (100) ,
 department varchar (50), 
 job_role varchar (50) ,
 salary decimal (10,2) default 20000,
 hire_date date,
 city varchar (50)
 );
 insert into company 
 (emp_id ,emp_name,department, job_role, salary ,hire_date,city)
 values 
 
 
 (101, 'Rahul Sharma', 'IT', 'Developer', 65000, '2021-01-15', 'Nagpur'),
(102, 'Priya Singh', 'HR', 'HR Manager', 75000, '2020-05-20', 'Mumbai'),
(103, 'Amit Kumar', 'IT', 'Developer', 70000, '2022-01-10', 'Pune'),
(104, 'Sneha Patil', 'Finance', 'Accountant', 60000, '2021-07-22', 'Nagpur'),
(105, 'Rohit Verma', 'IT', 'Tester', 55000, '2023-03-01', 'Mumbai'),
(106, 'Neha Joshi', 'HR', 'Recruiter', 50000, '2022-11-15', 'Pune'),
(107, 'Vikas Gupta', 'Finance', 'Manager', 85000, '2019-09-30', 'Delhi'),
(108, 'Anjali Rao', 'IT', 'Developer', 80000, '2020-12-05', 'Delhi'),
(109, 'Suresh Yadav', 'Sales', 'Executive', 45000, '2023-06-15', 'Nagpur'),
(110, 'Pooja Mehta', 'Sales', 'Manager', 70000, '2021-10-10', 'Mumbai');
 
 -- concat()
 select concat(emp_name ,length (emp_name) as' no. of characters'
 from company ;
 
 
 -- substr (string ,start,_position, length)
 select emp_name , substr( emp_name ,2,4),substring (emp_name,2,4) from company ;
 select substring ( emp_name,2,4) from company;
 
 
 
 -- trim (): removes unnecessary space --
 select 
 emp_name, trim(emp_name ) as 'cleaned _name'
 from company ;
 
 select length (' nagpur    '),length(trim 'nagpur  ')from dual;  ------
 
 
 select emp_name from company ;
 
 select 
 emp_name , replace ( emp_name, 'a','0') as modified_name, replace(emp_name,'g','9'), 
 replace(emp_name, 's' ,'5') ,replace(  emp_name ,'hul' ,'fool')
 from company;
 
 
 
 -- mathematical function
 -- 1) round()
 
 select emp_name,
 salary, salary/12,
 round( salary/12,3) as monthly_salary
 from company;
 
 -- 2) floor & ceil function()
 select 
 salary/12,
 floor ((salary/12)/1000) as rounded_down_salary,
 ceil(salary/12) as rounded_high_salary
 from company;
 
 
 
 -- 3) abs ()
 select abs(-222) from dual;
 select
 emp_name, job_role, salary,salary -6000,
 abs(salary - 6000) as salary_difference_with_abs
 from company ;
 
 
 
 -- 4) mod():
 select
 emp_id ,
 mod(emp_id,2) as remainder,
 mod( salary,2)
 from company;
 
 
 
 -- 5) power()
 select 
 power(salary,2) as salary_square
 from company;
 
 
 
 
 
 -- 1) GREATEST(): RETUEN THE LAREGEST VALUE
 SELECT MAX(SALARY) FROM COMPANY;
 
 SELECT GREATEST(78,12,781,234,78989,133098) from DUAL;
 SELECT GREATEST(SALARY,40000) AS ' SALARY_GREATER_THAN 40000' FROM COMPANY;
 
 SELECT 
 department,
 SALARY,
 GREATEST(SALARY,6000) AS SALARY_GREATER_THAN_60000
 FROM COMPANY;
 
 
 
 -- 2) LEAST(): WILL GIVE SMALLESTVALUE 
  SELECT  SALARY,
  least(SALARY,60000) AS 'SALARY_LESS THAN 60000'
  FROM COMPANY; 
  
  
  
  # COMAPRISION OPERATOR
 
 
 SELECT EMP_NAME, SALARY
 FROM COMPANY 
 WHERE SALARY > 60000;
 
 select department , concat('₹' ,ROUND(SUM(SALARY),0)) AS ' DEPARTMENT_SALARY'
 FROM COMPANY ;
 
 select DEPARTMENT , SUM(SALARY) FROM COMPANY 
 group by department HAVING SUM(SALARY)>120000 ORDER BY sum(SALARY) DESC;
 
 -- DISTINCT ()-- IT RETURNS UNIQUE VALUE OF COLOUMNS--
 SELECT COUNT(  DISTINCT CITY ) AS 'UNQUE CITIES',
 COUNT(CITY ) AS 'TOTAL CITIES'FROM COMPANY ;
 
 SELECT EMP_NAME, SALARY,SALARY*1.25 AS 'SALARY INCRESED BY 25%'
 FROM COMPANY
 WHERE CITY ='NAGPUR';
 
 select SALARY ,SALARY*(1-0.25) AS  ' SLARY REDUCED BY 25%' ,SALARY*0.9 AS 'SALARY REDUCED BY 10%'
 FROM COMPANY;
 
 
 # NOT EQUAL TO--> <>
 
 SELECT	 *FROM COMPANY WHERE SALARY !=50000;
 
 
 # COMPARISON BASED ON CLASSIFAICATION
 
 SELECT *,
 CASE 
 WHEN SALARY >=  75000 THEN ' HIGH SALARY'
 WHEN SALARY >=60000 THEN ' MEDIUM SALARY'
 ELSE 'LOW SALARY'
 END AS SALARY_CATEGORY
 FROM COMPANY ;
 
 
 # aggregation functionnin sql
 
 
 select count(emp_id) as total_employees from company ;
 
  select department , count(*) as ' department wise employee' from company group by department;
  
  select department , sum(salary) as 'total employee' from company group by department ;
  
  select department , avg(salary) as total_salary
  from company
  group by department;
  
  
  
  
  select 
  count(*) as 'total emp',
  sum(salary) as 'total_salary',
  avg (salary) as ' average_salary',
  max(salary) as' highest_salary',
  min(salary) as' lowest_salary'
  from company;
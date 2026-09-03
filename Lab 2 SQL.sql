use banking_db;
create table Accounts (
AccountID int, accounttype varchar(20),
balance decimal (10,2)
);
desc Accounts;


create table Transation (TransationID int, 
account decimal (10,2),
transationtype varchar (20)
);
desc transation;

CREATE TABLE Branches(
BranchID int, BranchName varchar (100),
BranchAddress varchar (200),Branchphone varchar (15)
);
desc Branches;


create table AccountBranches(
AssignmentDate date 
);

create table Loans(
LoanID INT,LoanAmount decimal(10,2),IntrestRate decimal(5,2),startdate date,enddate date
);

desc accounts;
desc Transation;

show tables;


# Modify the table structure by using ALTER command 
/* 1) add new columns 
2) modify existing coloumns
3)rename columns
4)add constraints
5)remove constraints
*/



desc customers;
alter table customers modify phone bigint;
desc customers;


--- change datatype of existing table  ---
desc customers;
--- add minimum balance constant ---
alter table customers add column Balance bigint;

alter table customers
add constraint chk_MinBalance
check(Balance>=5000);

--- drop 'accountbranches' table ---
--- snytax : drop table <table_name>;---
drop table accountbranches;

desc customers;


-- add primary key constraints to 'customerid' in customers table


select * FROM Customers;


DROP TABLE Customers;

CREATE TABLE Customers(
CustomerID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(20)
);

INSERT INTO Customers(CustomerID,FirstName,LastName,Email,Phone) VALUES (101,"Raj","Patil","Rajpatil@email.com",1234567890);
desc customers;
desc accounts;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE Branches;

/*-----insert into accounts values201,'saving',25000.00,101,----*/

desc customers;


/*
select * from accounts ;*/

insert into customers ( customerID, firstname, lastname, email, phone)
values (101,'rahul','sharma','rahul@gmail.com', 9876543210);
select*from customers; 

insert into accounts (accountID, accounttype, balance, customerid) values  (201,'saving',25000.00,101);


insert into customers ( customerID, firstname, lastname, email, phone)
values (102,'kunal','modi','modi@gmail.com', 1234567890);

update  customers set phone =7385233273 where customerID= 101;

DESC customers;
select *from customers;
update  customers set email ='rahulsharma@gmail.com' where customerID= 101;

describe customers;

show table status;
 
alter table accounts 
add constraint fk_accounts_customers
foreign key (customerID)
references customers (customerID);

 











---- DEFAULT ----


CREATE table Employee (
EmployeeID INT primary KEY,
EmployeeName varchar(100) not null,
Department varchar (50),
salary decimal (10,2),
joiningdate date default (current_date),
city varchar (50)
);

DESC Employee;
insert into employee
(employeeID,employeeName,department,salary,city)
values (1,'rahul','it',50000,'mumbai');

-- Insert Multiple Record---
alter table Employee MODIFY COLUMN SALARY INT DEFAULT 20000;

DESC EMPLOYEE;

insert into employee
(employeeID,employeeName,department,city) values(2,'raju','logistics','mumbai');


insert into employee
 (employeeID,employeeName,department,salary,city)
values
(3, 'Priya Patil','HR',45000,'Pune'),
(4,'sneha joshi','IT',55000,'Delhi'),
(5,'rohan verma','marketing',48000,'Mumbai');

# adding default constraint to an existing table:
alter table employee
alter city set default 'nagpur';
desc employee;



insert into employee
(employeeID,employeeName,department,salary) values
(7,'Neha Singh','hr',52000);

#foreign key
/*---use to create realtionship between two tables--
it ensures that avalue in one table must exist in another table*/

/* create parent table*/
create table Department (
DepartmentID int primary key,
DpartmentName varchar (59)
);
desc department;
 insert into department (departmentID ,dpartmentName)
 values
 (101,'it'),
 (102,'hr'),
 (103,'finance');
 
 CREATE TABLE EMPLOYEE_CHILD(
	 employeeid int primary key,
	 employeename varchar (100),
	 DepartmentID int,
	 ManagerID varchar(200),
     
	 foreign key(DepartmentID)
	 references Department(departmentID),
	 
	 foreign key(employeeid)
	 references manager(Managerid)
 );
 
 create table manager
 (Managerid varchar(200) primary key,
 ManagerName varchar(200) not null);
 
 create TABLE EMPLOYEE_CHILD(
	 employeeid int primary key,
	 employeename varchar (100),
	 DepartmentID int, 
	managerId VARCHAR (200),
    
    foreign key (DepartmentID)
    references department (departmentID),
    
    foreign key(managerid)
    references manager (managerid)
    );
    
    
    
    
    
     
	 
	 
 
 
 
 













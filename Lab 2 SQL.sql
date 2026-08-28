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
alter table customers
add primary key(CustomerID);

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

--Project name : DigiWallet
--Create database :DigiWallet
--create database DigiWallet
------------------------------------------------------------------------------------------------------------
--Use DigiWallet database
use DigiWallet
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Adding Tables to Batch
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Create user_master table
GO
create table [DigiWallet].[dbo].[user_master] (
user_id int primary key identity,
user_name varchar(200) DEFAULT NULL,
user_gender varchar(10) default null check(user_gender in('male','female')),
user_email varchar(200) DEFAULT NULL UNIQUE,
user_phone varchar(30) DEFAULT NULL,
user_full_name varchar(255) DEFAULT NULL,
user_password varchar(MAX),
user_image text,
user_role_id int NOT NULL DEFAULT 2,
user_insertdate datetime DEFAULT getdate(),
user_updatedate datetime DEFAULT NULL,
user_status varchar(10) DEFAULT 'ACTIVE' check(user_status in ('ACTIVE','DEACTIVE'))
)
------------------------------------------------------------------------------------------------------------
-- Create table for role_master
GO
create table [DigiWallet].[dbo].[role_master] (
role_id int primary key ,
role_name varchar(20) NOT NULL UNIQUE
)
------------------------------------------------------------------------------------------------------------
-- Create table trans_master
GO
create table [DigiWallet].[dbo].[trans_master] (
trans_id int primary key identity,
trans_user_id int NOT NULL,
trans_type varchar(20) NOT NULL CHECK(trans_type IN ('INCOME','EXPENSE','TRANSFER')),
trans_date datetime NOT NULL,
trans_account_id int NOT NULL,
trans_category_id int NOT NULL,
trans_sub_category_id int NOT NULL,
trans_amount money NOT NULL,
trans_note text DEFAULT NULL,
trans_description text DEFAULT NULL,
trans_image text DEFAULT NULL,
trans_status varchar(10) DEFAULT 'ACTIVE' check(trans_status in ('ACTIVE','DEACTIVE'))
)
------------------------------------------------------------------------------------------------------------
-- Create table account_group
GO
create table [DigiWallet].[dbo].[account_group] (
account_group_id int NOT NULL UNIQUE,
account_group_name varchar(30) NOT NULL CHECK(account_group_name IN ('Cash','Accounts','Card','Debit Card','Savings','Top-Up/Prepaid','Investments','Overdrafts','Loan','Insurance','Others'))
)
------------------------------------------------------------------------------------------------------------
-- Create table account_master
GO
create table [DigiWallet].[dbo].[account_master] (
account_id int primary key identity,
account_user_id int NOT NULL,
account_group_id int NOT NULL,
account_name varchar(30) NOT NULL,
account_amount money CHECK (account_amount >= 0),
account_description text DEFAULT NULL
)
------------------------------------------------------------------------------------------------------------
-- Create table category_master
GO
create table [DigiWallet].[dbo].[category_master] (
category_id int primary key identity,
category_user_id int NOT NULL,
category_name varchar(30) NOT NULL,
category_type varchar(20) NOT NULL CHECK(category_type IN ('INCOME','EXPENSE'))
)
------------------------------------------------------------------------------------------------------------
-- Create table sub_category
GO
create table [DigiWallet].[dbo].[sub_category] (
sub_category_id int primary key identity,
category_id int NOT NULL,
sub_category_name varchar(30) NOT NULL
)
------------------------------------------------------------------------------------------------------------
-- Create table label_master
GO
create table [DigiWallet].[dbo].[label_master] (
label_id int primary key identity,
label_user_id int NOT NULL,
label_name varchar(200)
)
------------------------------------------------------------------------------------------------------------
-- Create table trans_label
GO
create table [DigiWallet].[dbo].[trans_label] (
trans_label_trans_id int NOT NULL,
trans_label_label_id int NOT NULL
)
------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------
--Adding Indexes to batch
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Create index for user_master
--Purpose : Applying index on email column to speed up the select query to get user from user_master
GO
create index user_master_user_email_idx
on [DigiWallet].[dbo].[user_master] (user_email)
------------------------------------------------------------------------------------------------------------
--Create index for trans_master
--Purpose : Applying index on trans_user_id column to speed up the select query to get user transaction from trans_master
GO
create index trans_master_trans_user_id_idx
on [DigiWallet].[dbo].[trans_master] (trans_user_id)
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Adding Constraints to batch
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to user_master(user_role_id) to role_master(role_id)
--Purpose : to connect many user to one role (many-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[user_master]
ADD CONSTRAINT user_role_id_to_role_id_FK
FOREIGN KEY (user_role_id) REFERENCES role_master(role_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to account_master(account_user_id) to user_master(user_id)
--Purpose : to connect many accounts to one user (many-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[account_master]
ADD CONSTRAINT account_user_id_to_user_id_FK
FOREIGN KEY (account_user_id) REFERENCES user_master(user_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to account_master(account_group_id) to account_group(account_group_id)
--Purpose : to connect many accounts to one account group (many-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[account_master]
ADD CONSTRAINT account_group_id_to_account_group_id_FK
FOREIGN KEY (account_group_id) REFERENCES account_group(account_group_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to trans_master(trans_user_id) to user_master(user_id)
--Purpose : to connect one user to many (one-to-many) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[trans_master]
ADD CONSTRAINT trans_user_id_to_user_id_FK
FOREIGN KEY (trans_user_id) REFERENCES user_master(user_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to trans_master(trans_account_id) to account_master(account_id)
--Purpose : to connect one user transaction to one user account (one-to-one) relationship
--GO
--ALTER TABLE [DigiWallet].[dbo].[trans_master]
--ADD CONSTRAINT trans_account_id_to_account_id_FK
--FOREIGN KEY (trans_account_id) REFERENCES account_master(account_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to trans_master(trans_category_id) to category_master(category_id)
--Purpose : to connect one user transaction to one user category (one-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[trans_master]
ADD CONSTRAINT trans_category_id_to_category_id_FK
FOREIGN KEY (trans_category_id) REFERENCES category_master(category_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to trans_master(trans_sub_category_id) to sub_category(sub_category_id)
--Purpose : to connect one user transaction to one user sub category (one-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[trans_master]
ADD CONSTRAINT trans_sub_category_id_to_sub_category_id_FK
FOREIGN KEY (trans_sub_category_id) REFERENCES sub_category(sub_category_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to sub_category(category_id) to category_master(category_id)
--Purpose : to connect one category to many sub_category (one-to-many) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[sub_category]
ADD CONSTRAINT sub_category_id_to_category_id_FK
FOREIGN KEY (category_id) REFERENCES category_master(category_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to label_master(label_user_id) to user_master(user_id)
--Purpose : to connect many label to one user (many-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[label_master]
ADD CONSTRAINT label_user_id_to_user_id_FK
FOREIGN KEY (label_user_id) REFERENCES user_master(user_id)
ON DELETE CASCADE
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to trans_label(trans_label_label_id) to label_master(label_id)
--Purpose : to connect one transaction label to particular one label in label_master (one-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[trans_label]
ADD CONSTRAINT trans_label_label_id_to_label_master_label_id_FK
FOREIGN KEY (trans_label_label_id) REFERENCES label_master(label_id)
ON DELETE CASCADE
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to trans_label(trans_label_trans_id) to trans_master(trans_id)
--Purpose : to connect one transaction label to particular one transaction in trans_master (one-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[trans_label]
ADD CONSTRAINT trans_label_trans_id_to_trans_master_trans_id_FK
FOREIGN KEY (trans_label_trans_id) REFERENCES trans_master(trans_id)
ON DELETE CASCADE
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
-- Adding Procedures to batch
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Create procedure for user_master
--Purpose : To get user from user_master according to it's user_email
GO
create procedure sp_get_user_by_email 
@email varchar(200) 
AS
	print @email
	select * from [DigiWallet].[dbo].[user_master] AS u where u.user_email = @email
------------------------------------------------------------------------------------------------------------
--Create procedure for user_master
--Purpose : To get user from user_master according to it's user_email and it's password
GO
create procedure sp_get_user_by_email_and_password 
@email varchar(200),
@pwd varchar(MAX) 
AS
	print @email
	select * from [DigiWallet].[dbo].[user_master] AS u where u.user_email = @email and u.user_password = @pwd
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Adding Triggers to Batch
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
GO
CREATE TRIGGER AUTO_DEFAULT_ACCOUNT_INSERT_TG 
ON [DigiWallet].[dbo].[user_master]
FOR INSERT
AS 
BEGIN
	DECLARE @user_id INT
	select @user_id = user_id from inserted
	insert into [DigiWallet].[dbo].[account_master] (account_user_id,account_group_id,account_name,account_amount) values (@user_id,1,'Cash',0)
	insert into [DigiWallet].[dbo].[account_master] (account_user_id,account_group_id,account_name,account_amount) values (@user_id,2,'Accounts',0)
	insert into [DigiWallet].[dbo].[account_master] (account_user_id,account_group_id,account_name,account_amount) values (@user_id,3,'Card',0)
END
------------------------------------------------------------------------------------------------------------
GO
CREATE TRIGGER AUTO_DEFAULT_CATEGORY_INSERT_TG 
ON [DigiWallet].[dbo].[user_master]
FOR INSERT
AS 
BEGIN
	DECLARE @user_id INT
	select @user_id = user_id from inserted
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Food','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Lunch')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Dinner')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Eating Out')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Beverages')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Social Life','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Friend')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Fellowship')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Alumni')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Dues')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Self-devlopment','EXPENSE')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Transportation','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Bus')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Subway')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Taxi')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Car')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Culture','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Books')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Movie')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Music')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Apps')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Household','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Appliances')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Furniture')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Kitchen')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Toiletries')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Chandlery')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Apparel','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Clothing')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Fashion')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Shoes')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Laundary')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Beauty','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Cosmetics')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Makeup')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Accessories')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Beauty')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Health','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Gym')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Yoga')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Hospital')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Medicine')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Education','EXPENSE')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Schooling')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Textbooks')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'School supplies')
	insert into [DigiWallet].[dbo].[sub_category] (category_id,sub_category_name) values ((select top(1) category_id from category_master where category_user_id = @user_id ORDER BY category_id DESC),'Academy')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Gift','EXPENSE')

	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Other','EXPENSE')
	
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Allowance','INCOME')
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Salary','INCOME')
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Petty cash','INCOME')
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Bonus','INCOME')
	insert into [DigiWallet].[dbo].[category_master] (category_user_id,category_name,category_type) values (@user_id,'Other','INCOME')
END
------------------------------------------------------------------------------------------------------------
GO
CREATE TRIGGER AUTO_DEACTIVE_TRANS_WHEN_ACCOUNT_DELETE 
ON [DigiWallet].[dbo].[account_master]
FOR DELETE
AS 
BEGIN
	DECLARE @account_id INT
	select @account_id = account_id from deleted
	update trans_master set trans_status = 'DEACTIVE' where trans_account_id = @account_id
END

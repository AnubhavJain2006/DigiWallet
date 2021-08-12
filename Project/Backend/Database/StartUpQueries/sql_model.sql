--Project name : DigiWallet
--Create database :DigiWallet
--create database DigiWallet
------------------------------------------------------------------------------------------------------------
--Use DigiWallet database
use DigiWallet
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
user_password text,
user_image text,
user_role_id int DEFAULT NULL,
user_insertdate datetime DEFAULT getdate(),
user_updatedate datetime DEFAULT NULL,
user_status varchar(10) DEFAULT 'ACTIVE'
)
------------------------------------------------------------------------------------------------------------
--Create index for user_master
--Purpose : Applying index on email column to speed up the select query to get user from user_master
GO
create index user_master_user_email_idx
on [DigiWallet].[dbo].[user_master] (user_email)
------------------------------------------------------------------------------------------------------------
--Create procedure for user_master
--Purpose : To get user from user_master according to it's user_email
GO
create procedure sp_get_user_by_email 
@email varchar(200) 
AS
	print @email
	select * from user_master where user_email = @email
------------------------------------------------------------------------------------------------------------
-- Create table for role_master
GO
create table [DigiWallet].[dbo].[role_master] (
role_id int primary key ,
role_name varchar(20) NOT NULL UNIQUE
)
------------------------------------------------------------------------------------------------------------
-- Create table tran_master
GO
create table [DigiWallet].[dbo].[trans_master] (
trans_id int primary key identity,
trans_user_id int NOT NULL,
trans_type varchar(20) NOT NULL CHECK(trans_type IN ('INCOME','EXPENSE','TRANSFER')),
trans_date datetime NOT NULL,
trans_account_id int NOT NULL,
trans_category int NOT NULL,
trans_amount money NOT NULL,
trans_note text DEFAULT NULL,
trans_description text DEFAULT NULL,
trans_image text DEFAULT NULL
)
------------------------------------------------------------------------------------------------------------
--Adding Constraints to batch
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to user_master(user_role_id) to role_master(role_id)
--Purpose : to connect many user to one role (many-to-one) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[user_master]
ADD CONSTRAINT user_master_role_master_FK
FOREIGN KEY (user_role_id) REFERENCES role_master(role_id)
------------------------------------------------------------------------------------------------------------
--Add Foreign Key Constraint to trans_master(trans_user_id) to user_master(user_id)
--Purpose : to connect one user to many (one-to-many) relationship
GO
ALTER TABLE [DigiWallet].[dbo].[trans_master]
ADD CONSTRAINT trans_user_id_to_user_id_FK
FOREIGN KEY (trans_user_id) REFERENCES user_master(user_id)
------------------------------------------------------------------------------------------------------------

-- Project name : DigiWallet
------------------------------------------------------------------------------------------------------------
--Insert values into role_master
GO
INSERT INTO [DigiWallet].[dbo].[role_master] (role_id, role_name) values (1,'admin')
INSERT INTO [DigiWallet].[dbo].[role_master] (role_id, role_name) values (2,'user')
------------------------------------------------------------------------------------------------------------
--Insert values into account_group
GO
INSERT INTO [DigiWallet].[dbo].[account_group] values (1,'Cash')
INSERT INTO [DigiWallet].[dbo].[account_group] values (2,'Accounts')
INSERT INTO [DigiWallet].[dbo].[account_group] values (3,'Card')
INSERT INTO [DigiWallet].[dbo].[account_group] values (4,'Debit Card')
INSERT INTO [DigiWallet].[dbo].[account_group] values (5,'Savings')
INSERT INTO [DigiWallet].[dbo].[account_group] values (6,'Top-Up/Prepaid')
INSERT INTO [DigiWallet].[dbo].[account_group] values (7,'Investments')
INSERT INTO [DigiWallet].[dbo].[account_group] values (8,'Overdrafts')
INSERT INTO [DigiWallet].[dbo].[account_group] values (9,'Loan')
INSERT INTO [DigiWallet].[dbo].[account_group] values (10,'Insurance')
INSERT INTO [DigiWallet].[dbo].[account_group] values (11,'Others')
------------------------------------------------------------------------------------------------------------
--Insert values into user_master
GO
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Jay Bansod','jaybansod007@gmail.com','Jay@2000',1)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Jinu Gohil','jinugohil.com','ht5j6h46',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Anubhav Jain','anubhav@gmail.com','Anubhav@123',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Mihir Soni','sonimihir@outlook.com','ljfhregu9',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Prachi Shah','prachishaht1998@gmail.com','jfdkgd88w',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Pranay Desai','desaibrothers89@gmail.com','kvdvjfkj89',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Ravi Patel','patelravixyz@gmail.com','dmckfdjv8745',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Ruchi Dixit','ruchi1506@gmail.com','ljdgijr435',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Smit Mehta','smitmethta69@hotmail.com','jdsk7883fdf',2)
------------------------------------------------------------------------------------------------------------


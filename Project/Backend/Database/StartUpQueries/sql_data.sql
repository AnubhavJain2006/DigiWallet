-- Project name : DigiWallet
------------------------------------------------------------------------------------------------------------
--Insert values into role_master
GO
INSERT INTO [DigiWallet].[dbo].[role_master] (role_id, role_name) values (1,'admin')
INSERT INTO [DigiWallet].[dbo].[role_master] (role_id, role_name) values (2,'user')
------------------------------------------------------------------------------------------------------------
--Insert values into user_master
GO
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Jay Bansod','jaybansod@gmail.com','fghmiuyg',1)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Jinu Gohil','jinugohil.com','ht5j6h46',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Anubhav Jain','anubhv2001.com','k3jlljf9',1)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Mihir Soni','sonimihir@outlook.com','ljfhregu9',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Prachi Shah','prachishaht1998@gmail.com','jfdkgd88w',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Pranay Desai','desaibrothers89@gmail.com','kvdvjfkj89',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Ravi Patel','patelravixyz@gmail.com','dmckfdjv8745',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Ruchi Dixit','ruchi1506@gmail.com','ljdgijr435',2)
INSERT INTO [DigiWallet].[dbo].[user_master] (user_name,user_email,user_password,user_role_id) values ('Smit Mehta','smitmethta69@hotmail.com','jdsk7883fdf',2)
------------------------------------------------------------------------------------------------------------

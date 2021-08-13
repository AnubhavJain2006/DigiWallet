use digiwallet

insert into digiwallet.dbo.user_master(user_name,user_email,user_password) values ('Jay Bansod','jaybansod007@gmail.com','abcdefgh')

select * from user_master
select * from role_master

select user_name, user_email, role_name from user_master,role_master where user_role = role_id

select user_name, user_email, role_name from user_master 
JOIN role_master
ON user_role = role_id


select * from [DigiWallet].[dbo].[user_master] AS u where u.user_email = 'jaybansod007@gmail.com' and u.user_password = 'fghmiuyg'

Declare @email varchar(200)
set @email = 'jaybansod007@gmail.com'
EXEC sp_get_user_by_email 'jaybansod@gmail.com'
EXEC sp_get_user_by_email 'Jay Bansod'
EXEC sp_get_user_by_email_and_password 'jaybansod@gmail.com', 'fghmiuyg'


USE master;  
GO  
ALTER DATABASE digiwallet SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE digiwallet MODIFY NAME = DigiWallet;
GO  
ALTER DATABASE DigiWallet SET MULTI_USER
GO

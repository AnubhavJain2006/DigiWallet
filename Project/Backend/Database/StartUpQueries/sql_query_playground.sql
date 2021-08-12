use digiwallet

insert into digiwallet.dbo.user_master(user_name,user_email,user_password) values ('Jay Bansod','jaybansod007@gmail.com','abcdefgh')

select * from user_master

Declare @email varchar(200)
set @email = 'jaybansod007@gmail.com'
EXEC sp_get_user_by_email 'jaybansod007@gmail.com'


USE master;  
GO  
ALTER DATABASE digiwallet SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE digiwallet MODIFY NAME = DigiWallet;
GO  
ALTER DATABASE DigiWallet SET MULTI_USER
GO

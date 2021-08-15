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


select monthname(getdate())
SELECT DATENAME(WEEKDAY, getdate()) AS 'Month Name'
select DATEADD(DAY, 2, '2000-08-01')

--------------------------------------------
go
alter trigger AUTO_ACCOUNT_INSERT_TG 
on user_master
for insert
as 
Begin
	DECLARE @user_id int
	select @user_id = user_id from inserted
	insert into account_master (account_user_id,account_group_id,account_name,account_amount) values (@user_id,1,'Cash',0)
	insert into account_master (account_user_id,account_group_id,account_name,account_amount) values (@user_id,2,'Accounts',0)
	insert into account_master (account_user_id,account_group_id,account_name,account_amount) values (@user_id,3,'Card',0)
End
------------------------------------------------------------------------------------------------------------

select * from category_master where category_user_id = 1

select c.category_id,sub_category_id,category_name,sub_category_name from category_master as c
inner join sub_category AS s
on c.category_id = s.category_id
where category_user_id = 1

select * from account_master where account_user_id = 1

delete from account_master where account_id = 2

insert into trans_master values (1,'INCOME',getdate,2,1,1,300,NULL,NULL,NULL,'ACTIVE')

select * from trans_master

select am.account_name,ag.account_group_name,am.account_amount from account_master as am ,account_group as ag where am.account_group_id = ag.account_group_id and account_user_id = 3


select getdate()



select * from sub_category

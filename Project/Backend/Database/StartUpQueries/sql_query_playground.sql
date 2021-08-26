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

select * from user_master

select * from category_master where category_user_id = 3

select * from sub_category where category_id = 159

select tm.*,am.* from trans_master as tm, account_master as am where tm.trans_type = 'EXPENSE' and tm.trans_user_id = 3 and tm.trans_account_id = am.account_id

select * from sub_category where category_id = 47

select * from trans_master

--Query to get total income of user
select sum(trans_amount) from trans_master where trans_type = 'INCOME' and trans_user_id = 3

--Query to get total expense of user
select sum(trans_amount) from trans_master where trans_type = 'EXPENSE' and trans_user_id = 3

--Query to get total number of user account
select	count(*) from account_master where account_user_id = 3

-- Query to get total number of transaction
select count(*) from trans_master where trans_user_id = 3

	select * from trans_master

use DigiWallet

--Query for weekly
select * from trans_master where trans_user_id = 3 and trans_date between '2021-08-16 20:57:43.210' and '2021-08-22 20:57:43.210'

--Query for monthly
select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id=3 and  MONTH(trans_date) = 7 AND YEAR(trans_date) = 2021 order by tm.trans_date desc
select * from trans_master WHERE MONTH(trans_date) = 7 AND YEAR(trans_date) = 2021

--Query for annually
select * from trans_master WHERE YEAR(trans_date) = 2020

--Query for period
select * from trans_master where trans_user_id = 3 and trans_date between '2021-08-16 20:57:43.210' and '2021-08-22 20:57:43.210'

select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id=3 and trans_date between '2021-08-16 20:57:43.210' and '2021-08-22 20:57:43.210' order by tm.trans_date desc






select  CONVERT(DATE,trans_date) as dates , sum(trans_amount) as amount from trans_master group by trans_user_id, DATEPART(MONTH, trans_date), DATEPART(DAY, trans_date),trans_type,CONVERT(DATE,trans_date) having trans_type = 'EXPENSE' and trans_user_id = 3 AND (CONVERT(DATE,trans_date) between CONVERT(DATE, '2021-08-16 00:00:00.0') and CONVERT(DATE,'2021-08-22 00:00:00.0')) 

select CONVERT(DATE,trans_date) from trans_master where CONVERT(DATE,trans_date) between CONVERT(DATE, '2021-08-16 00:00:00.0') and CONVERT(DATE,'2021-08-22 00:00:00.0')


select  DATEPART(DAY, trans_date) as days , sum(trans_amount) as amount from trans_master where DATEPART(YEAR, trans_date) = 2021 group by trans_user_id, DATEPART(MONTH, trans_date), DATEPART(DAY, trans_date),trans_type order by MONTHS desc  

select DATEPART(DAY, trans_date) as days , sum(trans_amount) as amount from trans_master where trans_user_id = 3 and trans_type = 'EXPENSE' and DATEPART(YEAR, trans_date) = 2021 and DATEPART(MONTH, trans_date) = 8 group by DATEPART(DAY, trans_date)  order by days desc                                           


--------------------------------------------------------------------------------------------------------------
select cd.category_id, cd.category_name, cd.category_type, scd.sub_category_id, scd.category_id, scd.sub_category_name from category_default as cd
inner join sub_category_default as scd
on cd.category_id = scd.category_id
Order by cd.category_id desc, scd.sub_category_id desc



select category_id, category_name from category_default where category_type = 'EXPENSE' order by category_id desc 

select sub_category_id, sub_category_name from sub_category_default where category_id = -1 order by sub_category_id desc

select * from category_master

select category_id, category_name, category_isDeleted from category_master where category_type = 'EXPENSE' and category_user_id = 3 


select * from sub_category where category_id = 34

update category_master set category_isDeleted = 1 where category_user_id = 3 and category_id = 34

update category_master set category_name = 'self development 1' where category_user_id = 3 and category_id = 35


update sub_category set sub_category_isDeleted = 1 where sub_category_id = ?		


select * from category_master


use DigiWallet
------------------------------------------------------------------------------------------------------------
-- drop table user_master
GO
drop table [DigiWallet].[dbo].[user_master]
------------------------------------------------------------------------------------------------------------
--Drop or deleting index for user_master name : user_master_user_email_idx
--Here index will automatically dropped when a particular table is dropped
--drop index user_master_user_email_idx
--on [DigiWallet].[dbo].[user_master]
------------------------------------------------------------------------------------------------------------
--Drop procedure name : sp_get_user_by_email | purpose : to fetch user by it's email
GO
drop procedure sp_get_user_by_email
------------------------------------------------------------------------------------------------------------
-- drop table role_master
GO
drop table [DigiWallet].[dbo].[role_master]
------------------------------------------------------------------------------------------------------------
-- drop table tran_master
GO
drop table [DigiWallet].[dbo].[trans_master]
------------------------------------------------------------------------------------------------------------

use DigiWallet
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
-- Deleting all the constraint first before deleting table
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
-- drop constraint on user_master
GO
alter table [DigiWallet].[dbo].[user_master] drop constraint [user_role_id_to_role_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on user_master
GO
alter table [DigiWallet].[dbo].[account_master] drop constraint [account_user_id_to_user_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on user_master
GO
alter table [DigiWallet].[dbo].[account_master] drop constraint [account_group_id_to_account_group_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on trans_master
GO
alter table [DigiWallet].[dbo].[trans_master] drop constraint [trans_user_id_to_user_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on trans_master
GO
alter table [DigiWallet].[dbo].[trans_master] drop constraint [trans_account_id_to_account_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on trans_master
GO
alter table [DigiWallet].[dbo].[trans_master] drop constraint [trans_category_id_to_category_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on trans_master
GO
alter table [DigiWallet].[dbo].[trans_master] drop constraint [trans_sub_category_id_to_sub_category_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on sub_category
GO
alter table [DigiWallet].[dbo].[sub_category] drop constraint [sub_category_id_to_category_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on label_master
GO
alter table [DigiWallet].[dbo].[label_master] drop constraint [label_user_id_to_user_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on trans_master
GO
alter table [DigiWallet].[dbo].[trans_label] drop constraint [trans_label_label_id_to_label_master_label_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on trans_master
GO
alter table [DigiWallet].[dbo].[trans_label] drop constraint [trans_label_trans_id_to_trans_master_trans_id_FK]
------------------------------------------------------------------------------------------------------------
-- drop constraint on payee_master
GO
alter table [DigiWallet].[dbo].[trans_master] drop constraint [trans_payee_id_to_payee_id_FK]
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Deleting all Indexes
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Drop or deleting index for user_master name : user_master_user_email_idx
--Here index will automatically dropped when a particular table is dropped
--drop index user_master_user_email_idx
--on [DigiWallet].[dbo].[user_master]
------------------------------------------------------------------------------------------------------------
--Drop or deleting index for trans_master name : trans_master_trans_user_id_idx
--Here index will automatically dropped when a particular table is dropped
--drop index trans_master_trans_user_id_idx
--on [DigiWallet].[dbo].[trans_master]
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
-- Deleting all procedure
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
--Drop procedure name : sp_get_user_by_email | purpose : to fetch user by it's email
GO
drop procedure sp_get_user_by_email
------------------------------------------------------------------------------------------------------------
--Drop procedure name : sp_get_user_by_email_and_password | purpose : to fetch user by it's email and it's password
GO
drop procedure sp_get_user_by_email_and_password
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
-- Deleting every tables
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
-- drop table user_master
GO
drop table [DigiWallet].[dbo].[user_master]
------------------------------------------------------------------------------------------------------------
-- drop table role_master
GO
drop table [DigiWallet].[dbo].[role_master]
------------------------------------------------------------------------------------------------------------
-- drop table trans_master
GO
drop table [DigiWallet].[dbo].[trans_master]
------------------------------------------------------------------------------------------------------------
-- drop table account_group
GO
drop table [DigiWallet].[dbo].[account_group]
------------------------------------------------------------------------------------------------------------
-- drop table account_master
GO
drop table [DigiWallet].[dbo].[account_master]
------------------------------------------------------------------------------------------------------------
-- drop table category_master
GO
drop table [DigiWallet].[dbo].[category_master]
------------------------------------------------------------------------------------------------------------
-- drop table sub_category
GO
drop table [DigiWallet].[dbo].[sub_category]
------------------------------------------------------------------------------------------------------------
-- drop table label_master
GO
drop table [DigiWallet].[dbo].[label_master]
------------------------------------------------------------------------------------------------------------
-- drop table trans_label
GO
drop table [DigiWallet].[dbo].[trans_label]
------------------------------------------------------------------------------------------------------------
-- drop table payee_master
GO
drop table [DigiWallet].[dbo].[payee_master]
------------------------------------------------------------------------------------------------------------

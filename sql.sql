-- Active: 1709970858670@@127.0.0.1@1433
SELECT * FROM sys.databases;

CREATE DATABASE inventory;

SELECT
    session_id,
    login_name,
    host_name,
    program_name
FROM sys.dm_exec_sessions
WHERE
    database_id = DB_ID('model');

kill 62;

USE inventory;

EXEC sys.sp_cdc_enable_db;

CREATE TABLE customers (
    id int IDENTITY(1, 1) primary key, name varchar(255)
);

EXEC inventory.sys.sp_cdc_enable_table @source_schema = 'dbo',
@source_name = 'customers',
@role_name = NULL;

-- /* 2024-03-06 11:02:50 [506 ms] */
EXEC sys.sp_cdc_enable_db_change_data_capture;

-- /* 2024-03-06 11:04:40 [36 ms] */
-- SELECT TOP 100 name FROM sys.databases;
/* 2024-03-06 11:05:56 [8245 ms] */

SELECT * FROM customers

  insert into 
  customers (
    name
  )
values
  (
    'dqdqdqdq'
  );

SELECT * FROM customers;
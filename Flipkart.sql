show databases;

create database flipkart_project;

show tables;

select * from flipkart_ecom;

use FLIPKART_PROJECT;

update flipkart_ecom set GENDER = 
case
when GENDER = 'M' then 'Male'
when GENDER = 'F' then 'Female'
else GENDER
end;

select * from flipkart_ecom;

update flipkart_ecom set city = 
case
when city = 'Dl' then 'Delhi'
when city = 'Beng' then 'Bengaluru'
when city = 'Hyd' then 'Hyderabad'
else city
end;

select * from flipkart_ecom;

update flipkart_ecom set state = 
case
when state = 'MH' then 'Maharashtra'
when state = 'TN' then 'Tamil Nadu'
else state
end;

select * from flipkart_ecom;

update flipkart_ecom set state = 'Karnataka' where state = 'Karnatak';

select count(*) from flipkart_ecom;

create database sales_project;

create database ipl_project;

use sales_project;

select * from ecom;

update ecom set region = 
case
when region = 'E' then 'East'
when region = 'S' then 'South'
when region = 'W' then 'West'
else region 
end;

select * from ecom;
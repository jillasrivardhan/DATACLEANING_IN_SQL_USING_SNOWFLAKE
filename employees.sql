
use ipl_project;

select * from emp;

alter table emp RENAME column "C1" to "employee_id";
alter table emp RENAME column "C2" to "employee_name";
alter table emp RENAME column "C3" to "age";
alter table emp RENAME column "C4" to "city";
alter table emp RENAME column "C5" to "department";
alter table emp RENAME column "C6" to "salary";
alter table emp RENAME column "C7" to "email";
alter table emp RENAME column "C8" to "hire_date";
alter table emp RENAME column "C9" to "employee_status";


select * from emp;

DESCRIBE TABLE emp;   

delete FROM emp WHERE "employee_id" = 'employee_id';   

select * from emp order by employee_id;

ALTER TABLE emp RENAME COLUMN "employee_id" TO "EMPLOYEE_ID";   

alter table emp modify column employee_id int;

update emp set "employee_status" = 
case
when "employee_status" = 'ON LEAVE' then 'On Leave'
when "employee_status" = 'on leave' then 'On Leave'
when "employee_status" = 'INACTIVE' then 'Inactive'
when "employee_status" = 'inactive' then 'Inactive'
when "employee_status" = 'ACTIVE' then 'Active'
else "employee_status"
end;

select * from emp;

update emp set "hire_date" = current_date() where "hire_date" = 'not available' ;

update emp set "email" = concat("employee_name",'@gmail.com') where "email" is NULL;

select * from emp;
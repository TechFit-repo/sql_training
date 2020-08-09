create table supplier
(
  supplier_id numeric(10) not null,
  supplier_name varchar2(50),
  contact_name varchar2(50),
  supply_date date,
  state varchar2(50),
  customer_rep varchar2(50),
  constraint supplier_pk primary key (supplier_id)
);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- drop table supplier
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table customer
( customer_id numeric(10) not null,
  customer_name varchar2(50),
  contact_number numeric(10) not null,
  supplier_id numeric(10) not null,
  supplier_name varchar2(50),
  contact_name varchar2(50),
  supply_date date,
  state varchar2(50),
  customer_rep varchar2(50),
  constraint customer_pk primary key (customer_id),
  constraint fk_supplier
    foreign key (supplier_id)
    references supplier(supplier_id)
);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- drop table customer
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DML
-- Insert

insert into supplier
(supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
values
(5000, 'Apple','apl','01-JAN-2018','California','Michael');

insert all
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (1000,'IBM','ibm','01-APR-2018','NY','John')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (2000,'Microsoft','ms','01-MAY-2018','California','Paul')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (3000,'Google','gl','01-JUN-2018','California','Allen')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (4000,'Fitbit','ft','01-JUL-2018','United States','Patrick')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (6000,'Oracle','orc','01-AUG-2018','California','Kattie')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (7000,'SSE Airtricity','sse','01-SEP-2018','Scotland','Noel')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (8000,'Hive','he','01-OCT-2018','Sweden','James')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (9000,'Kaggle','kg','01-NOV-2018','LA','Barry')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (10000,'Docker','doc','01-DEC-2018','California','Grainne')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (11000,'Docker','doc','01-DEC-2018','California','Grainne')
select * from dual;

insert all
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (6000,'Glen',0858511111,1000,'IBM','ibm','01-APR-2018','NY','John')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (10000,'Glen',0858511111,2000,'Microsoft','ms','01-MAY-2018','California','Paul')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (8000,'Joanne',0858514561,3000,'Google','gl','01-JAN-2018','California','Michael')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (7000,'Marry',0858516781,4000,'Fitbit','ft','01-JUL-2018','United States','Patrick')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (13000,'Beckie',0858556111,5000, 'Apple','apl','01-JAN-2018','California','Michael')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (14000,'Chloe',0858511678,6000,'Oracle','orc','01-AUG-2018','California','Kattie')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (15000,'Sheila',0858518881,7000,'SSE Airtricity','sse','01-SEP-2018','Scotland','Noel')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (16000,'Ross',0858511999,8000,'Hive','he','01-OCT-2018','Sweden','James')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (17000,'Winnie',0858555511,9000,'Kaggle','kg','01-NOV-2018','LA','Barry')
select * from dual;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Select

select * from supplier;

select customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep from customer;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Eg Later 1

insert all
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (10000,'Docker','doc','01-DEC-2018','California','Grainne')
  into supplier (supplier_id, supplier_name, contact_name, supply_date, state, customer_rep) values (11000,'Docker','doc','01-DEC-2018','California','Grainne')
select * from dual;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Eg Later 2

insert all
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (18000,'Glen',0858539911,10000,'Docker','doc','01-DEC-2018','California','Grainne')
  into customer (customer_id, customer_name, contact_number, supplier_id, supplier_name, contact_name, supply_date, state, customer_rep)
    values (19000,'Glen',0858539911,10000,'Docker','doc','01-DEC-2018','California','Grainne')
select * from dual;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update
update customer
set supply_date = '01-DEC-2018',
    contact_name = 'audi'
where customer_id = 16000;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Delete/Delete with Exists
delete from supplier
where supplier_id = 11000;

delete from supplier
where supplier_name = 'Docker'
and supplier_id > 10000;

delete from supplier
where not exists
  (select *
    from customer
     where supplier.supplier_id = customer.supplier_id);



------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Select


select *
from supplier
where supplier_name like 'Kag%'; -- like (o)


select supplier_id, contact_name, supplier_name
from supplier
where supplier_id <= 5000
and supply_date <= '01-JUN-18'
order by supplier_id, supply_date desc;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Joins
-- Union
select supplier_id
from supplier
union
select supplier_id
from customer;

select supplier_name
from supplier
where lower(supplier_name) like '%o%'
union
select supplier_name
from customer
where lower(supplier_name) like '%o%'
order by 1;


-- Union All
select supplier_name
from supplier
where lower(supplier_name) like '%o%'
union all
select supplier_name
from customer
where lower(supplier_name) like '%o%'
order by 1;

-- Inner - Intersection
select * from supplier sp
    inner join customer ct
      on sp.supplier_id = ct.supplier_id;

-- Left - Outer
select * from supplier sp
    left join customer ct
      on sp.supplier_id = ct.supplier_id;

-- Right - Outer
select * from supplier sp
    right join customer ct
      on sp.supplier_id = ct.supplier_id;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------
-- Pivot
--------------------------------------

select * from
(
  select sp.supplier_id, sp.state, sp.supplier_name
      from supplier sp
    left join customer ct
      on sp.supplier_id = ct.supplier_id
)
pivot
(
  count(supplier_id)
  for state in ('California' ca, 'United States' un, 'Sweden' sd, 'Scotland' sc )
);
--order by customer_rep;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------
-- Row_Number()
--------------------------------------
-- run Eg 2
select customer_name, contact_number, row_id from
(
  select ct.*,
      row_number() over (partition by ct.customer_name, ct.contact_number order by ct.supply_date desc) row_id
      from supplier sp
    inner join customer ct
      on sp.supplier_id = ct.supplier_id
) table1

--where table1.row_id = 1
;


--------------------------------------
-- Rank()
--------------------------------------

--------------------------------------

select * from supplier;

alter table supplier add salary int;

-------------------------------------
update supplier
set salary = 10000
where customer_rep = 'Michael';
update supplier
set salary = 15000
where customer_rep = 'John';
update supplier
set salary = 11000
where customer_rep = 'Paul';
update supplier
set salary = 10500
where customer_rep = 'Allen';
update supplier
set salary = 20000
where customer_rep = 'Patrick';
update supplier
set salary = 30000
where customer_rep = 'Kattie';
update supplier
set salary = 16000
where customer_rep = 'Noel';
update supplier
set salary = 40000
where customer_rep = 'James';
update supplier
set salary = 50000
where customer_rep = 'Barry';
update supplier
set salary = 60000
where customer_rep = 'Grainne';

-------------------------------------

select spp.customer_rep, spp.salary,
      rank() over (partition by spp.state order by spp.salary) rank
      from
       (select table1.* from (
          select sp.customer_rep, sp.salary, sp.state,
            row_number() over (partition by sp.customer_rep order by sp.supply_date desc) row_id
            from supplier sp
          ) table1
            where table1.row_id = 1
       )spp
       where spp.state = 'California'
       ;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

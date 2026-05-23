select *
from dirty_cafe_sales
limit 10;

create table Staging_dirty_cafe_sales like dirty_cafe_sales;
insert into Staging_dirty_cafe_sales
select *
from dirty_cafe_sales;
select *
from Staging_dirty_cafe_sales;

select *,row_number() over(partition by `Transaction ID`,
`Payment Method`,`Location`,`Transaction Date`) as row_num
from staging_dirty_cafe_sales;

with staging_cts as (select *,row_number() over(partition by `Transaction ID`,`Item`,
`Payment Method`,`Location`,`Transaction Date`) as row_num
from staging_dirty_cafe_sales)
select *
from staging_cts
where row_num>1;

-- there is no duplicate 

-- handling null values
-- replace unknow , error by null

select item,COUNT(*) as item_null_value
from staging_dirty_cafe_sales
group by Item
;
update staging_dirty_cafe_sales
set Item = NULL
where Item='UNKNOWN' or Item='ERROR' or Item='';


select distinct `Payment Method`,count(*)
from staging_dirty_cafe_sales
group by `Payment Method` ;
 update staging_dirty_cafe_sales
 set `Payment Method` = NULL
 where `Payment Method`= 'UNKNOWN' or `Payment Method`='ERROR' or `Payment Method`='';
 
select distinct Location
from staging_dirty_cafe_sales;
 update staging_dirty_cafe_sales
 set Location = NULL
 where Location= 'UNKNOWN' or Location='ERROR' or Location='';
 
select distinct `Transaction Date`
from staging_dirty_cafe_sales
where `Transaction Date`= 'UNKNOWN' or `Transaction Date`='ERROR' or `Transaction Date`='';

update staging_dirty_cafe_sales
 set `Transaction Date` = NULL
 where `Transaction Date`= 'UNKNOWN' or `Transaction Date`='ERROR' or `Transaction Date`='';

select distinct `Price Per Unit`
from staging_dirty_cafe_sales;

select distinct `Total Spent`
from staging_dirty_cafe_sales;

update staging_dirty_cafe_sales
 set `Total Spent` = NULL
 where `Total Spent`= 'UNKNOWN' or `Total Spent`='ERROR' or `Total Spent`='';

select distinct `Transaction ID`
from staging_dirty_cafe_sales
 where `Transaction ID`= 'UNKNOWN' or `Transaction ID`='ERROR' or `Transaction ID`='';
-- droping some data
select*
from staging_dirty_cafe_sales
where   item is NULL and `Payment Method` is null and Location is null and `Transaction Date` is null ;

delete 
from staging_dirty_cafe_sales
where   item is NULL and `Payment Method` is null and Location is null and `Transaction Date` is null ;

select*
from staging_dirty_cafe_sales
where  item is NULL or `Payment Method` is null or Location is null or `Transaction Date` is null;
-- delete these data because these data contain null values that could false our analysis
delete 
from staging_dirty_cafe_sales
where   item is NULL or `Payment Method` is null or Location is null ;
select *
from staging_dirty_cafe_sales
where Quantity* `Price Per Unit`= `Total Spent`;

update staging_dirty_cafe_sales 
set `Total Spent`= Quantity* `Price Per Unit`;




-- standardized
select*
from staging_dirty_cafe_sales;

select distinct Item
from staging_dirty_cafe_sales;
select distinct `Payment Method`
from staging_dirty_cafe_sales;

select distinct Location, trim(Location)
from staging_dirty_cafe_sales;

update staging_dirty_cafe_sales 
set `Transaction Date`= str_to_date(`Transaction Date`,'%Y-%m-%d');

select *
from staging_dirty_cafe_sales
-- where Quantity* `Price Per Unit`= `Total Spent`
 where `Total Spent` is null



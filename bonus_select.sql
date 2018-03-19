use bonus_db;

select * from stock where isSold="true";
select * from stock where price > 100;
select * from stock where item_name="ps3";
select price from stock where item_name="dog";
select isSold from stock where price > 199;
select * from stock where price > 199;

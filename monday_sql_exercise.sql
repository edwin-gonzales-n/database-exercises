use codeup_test_db;

create table inventory(
id INT NOT NULL AUTO_INCREMENT,
name varchar(100),
price int(11) not null,
isSold boolean,
primary key(id));

insert into inventory(name, price,isSold)
values("widget","4.00",true),
("thing","2.00",false),
("Whatsit","9.00",true),
("Gadget","3.00",true); 

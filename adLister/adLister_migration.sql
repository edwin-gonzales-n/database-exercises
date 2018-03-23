use adlister;

create table users
(
id int not null auto_increment,
first_name varchar(250),
last_name varchar(250),
user_password binary(32),
user_email varchar(320),
primary key(id)
);

create table ads
(
id int not null auto_increment,
ad_title varchar(250),
ad_description varchar(250),
ad_category binary(32),
primary key(id)
);

create table categories
(
id int not null auto_increment,
cat_name varchar(250),
primary key(id)
);

create table ad_pivot
(
user_id int not null,
ads_id int not null,
categories_id int not null,
foreign key (user_id) references users(id),
foreign key (ads_id) references ads(id),
foreign key (categories_id) references categories(id)
);

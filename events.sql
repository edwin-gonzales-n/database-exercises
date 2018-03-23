use events;


-- creating table attendees
/*create table attendees(
id int not null auto_increment,
name varchar(100),
primary key(id)
);*/

-- creating table presentations
/*create table presentations(
id int not null auto_increment,
name varchar(255),
location varchar(255),
presentation_time datetime,
primary key(id)
);*/

-- creating table atteendee_presentations
create table attendee_presentation(
attendee_id int not null,
presentation_id int not null,
foreign key (presentation_id) references presentations(id),
foreign key (attendee_id) references attendees(id)
);
-- as you can see above we linked the two tables above to our pivet table

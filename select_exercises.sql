use codeup_test_db;

select name
  from albums
 where artist = "Pink Floyd";

select release_date
  from albums
 where name = "Sgt. Pepper's Lonely Hearts Club Band";

select genre
  from albums
 where name = "Nevermind";

select *
  from albums
 where release_date = "1990";

select *
  from albums
 where sales < "20";

select *
  from albums
 where genre = "Rock";

insert into countries (name) values ('argentina') , ('colombia'),('chile');
select * from countries;

insert into users (id_country, email, name) 
  values (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman');
  
select * from users;
 
DELETE FROM users WHERE email = 'bar@bar.com';

update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;

select * from users;

select * from users inner join  countries on users.id_country = countries.id_country;

SELECT u.id_users as id, u.email, u.name as fullname, c.name
from users u INNER JOIN countries c on u.id_country = c.id_country;

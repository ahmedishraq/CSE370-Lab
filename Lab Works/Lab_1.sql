--------------------------
CREATE TABLE USERS(
member_id char(3),
name varchar(30),
email varchar(50),
influence_count varchar(10),
member_since date,
multiplier char(4)
);

INSERT INTO USERS VALUES
('1','Taylor Otwell','otwell@laravel.com','739360','2020-6-10','10'),
('2','Ryan Dahl','ryan@nodejs.org','633632','2020-04-22','10'),
('3','Brendan Eich','eich@javascript.com','939570','2020-05-07','8'),
('5','Evan You','you@vuejs.org','982630','2020-06-11','7'),
('6','Rasmus Lerdorf','lerdorf@php.net','937927','2020-06-3','8'),
('7','Guido van Rossum','guido@python.org','968827','2020-07-18','19'),
('8','Adrian Holovaty','adrian@djangoproject.com','570724','2020-05-07','5'),
('9','Simon Willison','simon@djangoproject.com','864615','2020-04-30','4'),
('10','James Gosling','james@java.com','719491','2020-05-18','5'),
('11','Rod Johnson','rod@spring.io','601744','2020-05-18','7'),
('12','Satoshi Nakamoto','nakamoto@blockchain.com','630488','2020-05-10','10');
--------------------------

01. Change the column name “influence_count”. The new name should be “followers” and the data type should be integer. 
=> ALTER TABLE users CHANGE influence_count followers int;

02. Change the column name “member_since”. The new name should be “joining_date” and the data type should be date. 
=> ALTER TABLE users CHANGE member_since joining_date date;

03. Show the name, email, and follower number of the developers.
=> SELECT name, email, followers FROM users;

04. There is a formula to find the efficiency of the developers.
Efficiency = ((followers*100/1000000) * (multipliers*100/20))/100.
Find the efficiency of each developer and show them in a column named “Efficiency”.
=> SELECT name, ((followers*100/1000000) * (multiplier*100/20))/100 as Efficiency FROM users;

05. Change the Data Type of “multiplier” from integer to character type. Keep in mind that the multiplier cannot be greater than 20. 
=> ALTER TABLE users MODIFY COLUMN multiplier char(2);
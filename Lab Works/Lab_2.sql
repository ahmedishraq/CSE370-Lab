01. Find all the unique multipliers in the table and show them in descending order.
=> SELECT DISTINCT multiplier FROM users ORDER BY multiplier DESC;

02. Show all the unique dates of the users joining in ascending order.
=> SELECT DISTINCT member_since FROM users ORDER BY influence_count;

03. Find all ids and email addresses where the TLD (Top Level Domain) is ‘com’ (ends with ‘com’)
=> SELECT id, email FROM users WHERE email LIKE '%com'

04. Show the name and email of the latest 5 members
=> SELECT name, email FROM users ORDER BY member_since DESC LIMIT 5;

05. Find the total number of users in the table.
=> SELECT COUNT(*) FROM users;

06. Count number of users in each multiplier who has joined after the month "April"
=>SELECT COUNT(*),multiplier FROM users WHERE MONTH(member_since)>04 GROUP BY multiplier;

07. Find the average length of all the names. 
=> SELECT AVG(LENGTH(name)) from users;

09. Show the users according to their joining date (the user who joined first will be at the top and so on)
=> SELECT name, email, member_since FROM users ORDER BY member_since;

10. Show the name of the user who has the highest influence_count among the users  joined after May 2020
=> SELECT name, MAX(influence_count) FROM users WHERE MONTH(member_since)>05 and YEAR(member_since)>2019 GROUP BY name HAVING MAX(influence_count)>980000;

11. Show the name of the user with the maximum multiplier among the users whose influencer counts are less than 700000.
=> SELECT name, MAX(multiplier) FROM users WHERE influence_count < 700000 GROUP BY name; 

12. Find all the unique multipliers among the members whose influence count is less than 900000. 
=> SELECT DISTINCT multiplier FROM users WHERE influence_count < 900000;
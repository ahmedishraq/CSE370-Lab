01. Find all the unique multipliers in the table and show them in descending order.
=> SELECT DISTINCT multiplier FROM users ORDER BY multiplier DESC;

02. Show all the unique dates of the users joining in ascending order.
=> SELECT DISTINCT member_since FROM users ORDER BY influence_count;

03. Find all ids and email addresses where the TLD (Top Level Domain) is ‘com’ (ends with ‘com’)
=> SELECT id, email FROM users WHERE email LIKE '%com';

04. Show the name and email of the latest 5 members
=> SELECT name, email FROM users ORDER BY member_since DESC LIMIT 5;

05. Find the total number of users in the table.
=> SELECT COUNT(*) FROM users;

06. Count number of users in each multiplier who has joined after the month "April"
=> SELECT COUNT(*),multiplier FROM users WHERE MONTH(member_since)>04 GROUP BY multiplier;

07. Find the average length of all the names. 
=> SELECT AVG(LENGTH(name)) from users;

08. Find the number of unique TLDs of email addresses.
=> SELECT SUBSTRING_INDEX(email, '.', -1) AS tld_name, COUNT(*) AS tld_count FROM users GROUP BY SUBSTRING_INDEX(email, '.', -1);

09. Show the users according to their joining date (the user who joined first will be at the top and so on)
=> SELECT name, email, member_since FROM users ORDER BY member_since;

10. Show the name of the user who has the highest influence_count among the users  joined after May 2020
=> SELECT name FROM users WHERE influence_count=(SELECT MAX(influence_count) FROM users) AND MONTH(member_since)>05 AND YEAR(member_since)>2019;

11. Show the name of the user with the maximum multiplier among the users whose influencer counts are less than 700000.
=> SELECT name FROM users WHERE multiplier=(SELECT MAX(multiplier) FROM users) AND influence_count<700000; 

12. Find all the unique multipliers among the members whose influence count is less than 900000. 
=> SELECT DISTINCT multiplier FROM users WHERE influence_count < 900000;

13. Find the average of the influence count but only consider the members who joined before 11 June 2020.
=> SELECT AVG(influence_count) FROM users WHERE member_since<'2020-06-11';

14. Find the id, name, email, and multiplier of those members whose influence count is within the range 700000 and 990000 and who has become a member of the platform after 18 May 2020.
=> SELECT id, name, email, multiplier FROM users WHERE member_since>'2020-05-18' AND influence_count BETWEEN '700000' AND '990000';

15. Retrieve the id, name, email, and influence count of the users who have all these characters -  "u,o,v,n,s,m" in their name. 
=> SELECT id, name, email, influence_count FROM users WHERE name LIKE '%u%' AND '%o%' AND '%v%' AND '%n%' AND '%s%' AND '%m%';
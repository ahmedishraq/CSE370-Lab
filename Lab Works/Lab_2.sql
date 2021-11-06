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
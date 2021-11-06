01. Find all the unique multipliers in the table and show them in descending order.
=> SELECT DISTINCT multiplier FROM users ORDER BY multiplier DESC;

02. Show all the unique dates of the users joining in ascending order.
=> SELECT DISTINCT member_since FROM users ORDER BY influence_count;

03. Find all ids and email addresses where the TLD (Top Level Domain) is ‘com’ (ends with ‘com’)
=> SELECT id, email FROM users WHERE email LIKE '%com'

04. Show the name and email of the latest 5 members
=> SELECT name, email FROM users ORDER BY member_since DESC LIMIT 5;
01. Find all the unique multipliers in the table and show them in descending order.
=> SELECT DISTINCT multiplier FROM users ORDER BY multiplier DESC;

02. Show all the unique dates of the users joining in ascending order.
=> SELECT DISTINCT member_since FROM users ORDER BY influence_count;

03. Find all ids and email addresses where the TLD (Top Level Domain) is ‘com’ (ends with ‘com’)
=> SELECT id, email FROM users WHERE email LIKE '%com'
1.  Find the name and loan number of all customers having a loan at the Downtown branch. 
=> SELECT C.customer_name,L.loan_number FROM customer C,borrower B,loan L where C.customer_id=B.customer_id AND B.loan_number=L.loan_number AND L.branch_name='Downtown';

2. Find the names of branches whose assets are greater than the assets of some branch in Horseneck.
=> SELECT branch_name FROM branch b1 WHERE NOT EXISTS(SELECT branch_name WHERE b1.branch_city="Horseneck")
   AND b1.assets>ANY(SELECT assets FROM branch WHERE branch_city="Horseneck");

 3. Find the number of depositors for each branch (your results should show branches with no deposits as 0).
=> SELECT b.branch_name, count(a.account_number) AS "number of depositors" FROM (account a
   RIGHT JOIN branch b ON a.branch_name=b.branch_name) GROUP BY branch_name;

4. Find all the possible pairs of customers who are from the same city. show in the format Customer1, Customer2, City
=> SELECT c1.customer_name AS "Customer1", c2.customer_name AS "Customer2", c1.customer_city AS
   "City" FROM customer c1, customer c2 WHERE c1.customer_city=c2.customer_city AND c1.customer_id
   !=c2.customer_id;

5. If the bank gives out 4% interest to all accounts, show the total interest across each branch. Print Branch_name, Total_Interest
=> SELECT branch_name, (SUM(balance)*4)/100 AS "Total Interest" FROM account GROUP BY branch_name;

6. Find account numbers with the highest balances for each city in the database
=> SELECT a.account_number FROM (account a INNER JOIN branch b ON a.branch_name=b.branch_name) WHERE
   (b.branch_city, a.balance) IN (SELECT b.branch_city, max(a.balance) FROM (account a INNER JOIN
   branch b ON a.branch_name=b.branch_name) GROUP  BY b.branch_city);

7. Find the names of branches whose assets are less than the assets of all branches in Brooklyn.
=> SELECT branch_name FROM branch WHERE assets<ALL(SELECT assets FROM branch WHERE branch_city="Brooklyn");

8. Show the loan number, loan amount, and name of customers who have the top 5 highest loan amounts. The data should be sorted by increasing amounts, then decreasing loan numbers in case of the same loan amount. [Hint for top 5 check the "limit" keyword in mysql]
=> SELECT c.customer_name, l.loan_number, l.amount FROM ((customer c INNER JOIN borrower b ON c.customer_id=b.customer_id)
   INNER JOIN loan l ON b.loan_number=l.loan_number) ORDER BY l.amount ASC, l.loan_number DESC;
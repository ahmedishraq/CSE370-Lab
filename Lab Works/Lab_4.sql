1.  Find the name and loan number of all customers having a loan at the Downtown branch. 
=> SELECT C.customer_name,L.loan_number FROM customer C,borrower B,loan L where C.customer_id=B.customer_id AND B.loan_number=L.loan_number AND L.branch_name='Downtown';

2. Find the names of branches whose assets are greater than the assets of some branch in Horseneck.
=> SELECT branch_name FROM branch b1 WHERE NOT EXISTS(SELECT branch_name WHERE b1.branch_city="Horseneck")
   AND b1.assets>ANY(SELECT assests FROM branch WHERE branch_city="Horseneck");

 3. Find the number of depositors for each branch (your results should show branches with no deposits as 0).
=> SELECT b.branch_name, count(a.account_number) AS "number of depositors" FROM (account a
   RIGHT JOIN branch b ON a.branch_name=b.branch_name) GROUP BY branch_name;
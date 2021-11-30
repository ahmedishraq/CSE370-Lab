1.  Find the name and loan number of all customers having a loan at the Downtown branch. 
=> SELECT C.customer_name,L.loan_number FROM customer C,borrower B,loan L where C.customer_id=B.customer_id AND B.loan_number=L.loan_number AND L.branch_name='Downtown';

2. Find the names of branches whose assets are greater than the assets of some branch in Horseneck.
=> SELECT B1.
branch_name 
FROM
 branch
 B1 WHERE
 B1.branch_city<>'Horseneck'
 AND B1.assets>ANY(SELECT B2.assets
 FROM
 branch B2
 WHERE
 B2.branch_city='Horseneck');

 3. Find the number of depositors for each branch (your results should show branches with no deposits as 0).
=> SELECT COUNT(*) AS Number of depositors FROM customer C, depositor D, account A WHERE
   C.customer_id=D.customer_id and D.account_number=A.account_number GROUP BY A.branch_name;
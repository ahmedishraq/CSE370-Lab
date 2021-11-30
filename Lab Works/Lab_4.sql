1.  Find the name and loan number of all customers having a loan at the Downtown branch. 
=> SELECT C.customer_name,L.loan_number FROM customer C,borrower B,loan L where C.customer_id=B.customer_id AND B.loan_number=L.loan_number AND L.branch_name='Downtown';

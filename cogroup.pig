A= load '/home/hduser/purchase.txt' using PigStorage(',') as (prod:int,pqty:int);

B= load '/home/hduser/sales.txt' using PigStorage (',') as (prod:int,sqty:int);

C=cogroup A by $0 B by $0;

D= foreach C generate group,SUM(A.pqty),SUM(B.sqty);

D=foreach C generate group,SUM(A.pqty),SUM(B.sqty),COUNT(A),SUM(B.sqty),COUNT(B);








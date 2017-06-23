A= load '/home/hduser/txns1.txt' using PigStorage(',') as (txnid:int,date,custid:int,amt:double,catrgory,item,state,city,spentmethod);

B= load '/home/hduser/custs' using PigStorage (',') as (custid:int,firstname:bytearray,lastname:bytearray,age:long,profession:bytearray);

C=cogroup A by $2 , B by $0;

D= foreach C generare group,COUNT(A.item);

E= foreach C generate group,COUNT(A.item),SUM(A.amt),B.firstname;


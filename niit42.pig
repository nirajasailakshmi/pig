txns1 = LOAD'/home/hduser/txns1.txt' USING PigStorage(',') AS (txnid,date,custid,amount:double,category,product,city,state,spentmethod);

txns1bygrp = group txns1 all;

totalcount= foreach txns1bygrp generate COUNT(txns1.txnid);

dump totalcount;

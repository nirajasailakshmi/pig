txns1= LOAD '/home/hduser/txns1.txt' USING PigStorage(',') AS (txnid,date,custid,amount:double,category,product,city,state,spentmethod);

cust= LOAD '/home/hduser/custs' USING PigStorage (',') AS (custid,firstname,lastname,age:long,profession);

custlessthan50= filter cust by age <50;

groupbycust= group txns1 by custid;
 
custbyamount= foreach groupbycust generate group,SUM(txns1.amount) as total;

 custmorethan500= filter custbyamount by total >500;

dump custmorethan500;

joined= join custmorethan500 by $0, custlessthan50 by $0;

dump joined;

agelessthan50= filter joined by age <50;

dump agelessthan50;
 
final= foreach joined  generate $0,$3,$4,$5,$6, ROUND_TO($1,2);

dump final;

store final into '/home/hduser/text' using PigStorage(',');
store final into '/home/hduser/binary' using BinStorage();


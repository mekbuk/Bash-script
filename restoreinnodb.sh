#/bin/bash
for i in `cat /usr/local/src/innodb_databases-08012016.txt`; do
echo $i;
echo "/var/lib/mysql/$i"
#ls -la /home/mysqlbackup/$i.sql
mv /var/lib/mysql/$i /home/sachinn/mysqlrestore;
mysqladmin create $i;
mysql $i < /home/mysqldump-08012016/$i.sql;
done

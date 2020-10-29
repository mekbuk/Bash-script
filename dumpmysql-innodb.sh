#/bin/bash
for i in `cat /usr/local/src/innodb_databases-08012016.txt`; do
mysqldump -ER $i > /home/mysqldump-08012016/$i.sql;
done


//Before executing above script, file innodb_databases-08012016.txt which contains list of all the innodb databases must be present 
  on the location. To get the list of all innodb databases, use below commands
  
To find out Innodb databases
================
mysql -N mysql -e "SELECT table_schema, table_name FROM INFORMATION_SCHEMA.TABLES WHERE engine = 'innodb';" | awk '{print $1}' | sort | uniq > /usr/local/src/innodb_databases-08012016.txt
find /var/lib/mysql -name "*.ibd"|awk -F / '{print $5}'|sort -n|uniq > /usr/local/src/innodb_databases-08012016.txt


MySQL variables used are 
 -e, --execute=name  Execute command and quit. (Disables --force and history file.)
 -N, --skip-column-names Don't write column names in results.
================
//

bash /cps301/util/startmysql.sh

mysql -e "drop database if exists ordentry"
mysql -e "create database ordentry"
mysql ordentry < /cps301/sampledb/ordentry.sql


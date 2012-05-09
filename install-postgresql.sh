sudo aptitude install postgresql-8.4 postgresql-server-dev-8.4
sudo su - postgres
vim /etc/postgresql/8.4/main/pg_hba.conf
...
- host    all         all         127.0.0.1/32          md5
+ host    all         ka          0.0.0.0/0             md5
...

vim /etc/postgresql/8.4/main/postgresql.conf
...
  #listen_addresses = 'localhost'         # what IP address(es) to listen on;
+ listen_addresses = '*'
...

exit
sudo service postgresql-8.4 restart
sudo su - postgres
psql
# CREATE ROLE ka ENCRYPTED PASSWORD '****' LOGIN;
# CREATE ROLE ka_test ENCRYPTED PASSWORD '***' LOGIN CREATEDB;
# ALTER ROLE ka WITH ENCRYPTED PASSWORD '****'; # if you want to correct password
createdb mydb_development
createdb mydb_production
psql
# GRANT ALL PRIVILEGES ON DATABASE mydb_development TO ka;
# GRANT ALL PRIVILEGES ON DATABASE mydb_production TO ka;
psql mydb_production -U ka < dumpfile # pg_dump mydb_production -O > dumpfile # on somewhere

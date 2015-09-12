# To avoid the following error
#Error: The locale requested by the environment is invalid.
echo 'LC_ALL="en_US.UTF-8"' | sudo tee -a /etc/environment

sudo apt-get -y install postgresql-9.3 postgresql-server-dev-9.3
# ref. http://stackoverflow.com/questions/17399622/postgresql-9-2-installation-on-ubuntu-12-04/20137471#20137471

# Disable auto starting
# ref. http://dba.stackexchange.com/questions/31210/preventing-postgresql-from-starting-on-boot-in-ubuntu
cat /etc/postgresql/9.3/main/start.conf | \
  sed 's/^auto$/manual/' | \
  sudo tee /etc/postgresql/9.3/main/start.conf

# Create a user
sudo su postgres -c "createuser `whoami` -d -l"

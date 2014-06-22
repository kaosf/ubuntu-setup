# To avoid the following error
#Error: The locale requested by the environment is invalid.
echo 'LC_ALL="en_US.UTF-8"' | sudo tee -a /etc/environment

sudo aptitude install postgresql-9.3 postgresql-server-dev-9.3
# ref. http://stackoverflow.com/questions/17399622/postgresql-9-2-installation-on-ubuntu-12-04/20137471#20137471

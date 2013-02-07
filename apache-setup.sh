# Apache2
sudo aptitude install apache2
sudo a2enmod rewrite
sudo vim /etc/apache2/site-available/default
...
- 	DocumentRoot /var/www
+ 	DocumentRoot /home/ka/www
...
- 	<Directory /var/www/>
- 		Options Indexes FollowSymLinks MultiViews
- 		AllowOverride None
+ 	<Directory /home/ka/www/>
+ 		Options ExecCGI Indexes FollowSymLinks MultiViews
+ 		AllowOverride All
...

mkdir $HOME/www
sudo service apache2 restart

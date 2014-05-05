sudo aptitude install apache2
sudo a2enmod rewrite
sudo a2enmod userdir
sudo vim /etc/apache2/site-available/default
# Add "ExecCGI" for CGI
#- 		Options Indexes FollowSymLinks MultiViews
#+ 		Options ExecCGI Indexes FollowSymLinks MultiViews

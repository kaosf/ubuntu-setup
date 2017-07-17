sudo apt-get -y install apache2 apache2-utils
cat <<EOF | sudo tee /etc/apache2/sites-available/default.conf
<VirtualHost *:80>
  ServerName my.domain.com

  ProxyRequests Off
  <Proxy *>
    Require all granted
  </Proxy>

  ProxyPass / http://myherokuappname.herokuapp.com/
  ProxyPassReverse / http://myherokuappname.herokuapp.com/
</VirtualHost>
EOF
sudo a2enmod proxy_http
sudo a2dissite 000-default
sudo a2ensite default
sudo service apache2 restart

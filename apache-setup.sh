sudo aptitude install apache2 apache2-utils
cat <<EOF | sudo tee /etc/apache2/sites-available/default.conf
<VirtualHost *:80>
  ServerName kaosfield.net

  ProxyRequests Off
  <Proxy *>
    Require all granted
  </Proxy>

  ProxyPass / http://ka-ring.herokuapp.com/
  ProxyPassReverse / http://ka-ring.herokuapp.com/
</VirtualHost>
EOF
sudo a2enmod proxy_http
sudo a2dissite 000-default
sudo a2ensite default
sudo service apache2 restart

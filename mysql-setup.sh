sudo aptitude install mysql-server-5.6 mysql-client-5.6 libmysqlclient-dev
# Set "root" user password

# Disable autostart
# ref. http://askubuntu.com/questions/468241/how-can-i-ensure-a-service-is-disabled-on-boot
echo manual | sudo tee /etc/init/mysql.override

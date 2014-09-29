# Setup Ruby at first
# ref. ruby-setup.sh

# Passenger + Nginx
gem install passenger --no-ri --no-rdoc
rbenv rehash
sudo aptitude -y install libcurl4-openssl-dev
export ORIG_PATH="$PATH"
sudo -s -E
export PATH="$ORIG_PATH"
/home/username/.rbenv/versions/2.1.3/bin/ruby /home/username/.rbenv/versions/2.1.3/lib/ruby/gems/2.1.0/gems/passenger-4.0.50/bin/passenger-install-nginx-module
# Follow the guides of Passenger

# Edit /opt/nginx/conf/nginx.conf
#   From
#     server {
#       ...
#     }
#   To
#     server {
#         listen 80;
#         server_name my.domain.net;
#         root /some/where/rails-project/public;
#         passenger_enabled on;
#     }

# Prepare /etc/init.d/nginx and setup as a daemon.
# ref. https://github.com/jnstq/rails-nginx-passenger-ubuntu
git clone git://github.com/jnstq/rails-nginx-passenger-ubuntu.git
sudo mv rails-nginx-passenger-ubuntu/nginx/nginx /etc/init.d/nginx
sudo chown root:root /etc/init.d/nginx
sudo /usr/sbin/update-rc.d -f nginx defaults
sudo service nginx start
sudo service nginx stop

# Edit /etc/init.d/nginx to add environment variables.
# ref. http://qiita.com/ka_/items/a19f65628bdc213fc8f5

sudo service nginx start

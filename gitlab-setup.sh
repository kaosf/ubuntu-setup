# ref.
#   http://gitlab.org/
#   http://gitlab.org/gitlab-ce/
#   https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md

# Ubuntu Server 12.04 amd64 on Sakura VPS 1G

# 0. Install Vim for editing text file configurations
sudo aptitude install vim

# 1. Packages/Dependencies
sudo aptitude update
sudo aptitude safe-upgrade
sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl git-core openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev
# Python 2.7.3
# => OK # 2. Ruby
mkdir /tmp/ruby && cd /tmp/ruby
curl --progress ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz | tar xz
cd ruby-2.0.0-p247
./configure
make
sudo make install
sudo gem install bundler --no-ri --no-rdoc

# 3. System Users
sudo adduser --disabled-login --gecos 'GitLab' git

# 4. GitLab shell
cd /home/git
sudo -u git -H git clone https://github.com/gitlabhq/gitlab-shell.git
cd gitlab-shell
sudo -u git -H git checkout v1.7.1
sudo -u git -H cp config.yml.example config.yml
sudo -u git -H vim config.yml
# ...
# # Url to gitlab instance. Used for api calls. Should end with a slash.
#-gitlab_url: "http://localhost/"
#+gitlab_url: "http://my.domain.com/"
# 
# http_settings:
# ...
sudo -u git -H ./bin/install

# 5. Database
# choose PostgreSQL
sudo apt-get install -y postgresql-9.1 libpq-dev
sudo -u postgres psql -d template1
template1=# CREATE USER git WITH PASSWORD 'My5ecretPassw0rd';
template1=# CREATE DATABASE gitlabhq_production OWNER git;
template1=# \q
sudo -u git -H psql -d gitlabhq_production # try to connect
gitlabhq_production=> \q

# 6. GitLab
cd /home/git
sudo -u git -H git clone https://github.com/gitlabhq/gitlabhq.git gitlab
cd /home/git/gitlab
sudo -u git -H git checkout 6-1-stable
sudo -u git -H cp config/gitlab.yml.example config/gitlab.yml
sudo -u git -H vim config/gitlab.yml
# ...
#     ## Web server settings
#-    host: localhost
#+    host: my.domain.com
#     port: 80
# ...
sudo chown -R git log/
sudo chown -R git tmp/
sudo chmod -R u+rwX  log/
sudo chmod -R u+rwX  tmp/
sudo -u git -H mkdir /home/git/gitlab-satellites
sudo -u git -H mkdir tmp/pids/
sudo -u git -H mkdir tmp/sockets/
sudo chmod -R u+rwX  tmp/pids/
sudo chmod -R u+rwX  tmp/sockets/
sudo -u git -H mkdir public/uploads
sudo chmod -R u+rwX  public/uploads
sudo -u git -H cp config/unicorn.rb.example config/unicorn.rb
sudo -u git -H git config --global user.name "GitLab"
sudo -u git -H git config --global user.email "gitlab@localhost"
sudo -u git -H git config --global core.autocrlf input
sudo -u git cp config/database.yml.postgresql config/database.yml
sudo -u git -H vim config/database.yml
# ...
# production:
#   adapter: postgresql
#   encoding: unicode
#   database: gitlabhq_production
#   pool: 10
#   username: git
#-  password:
#+  password: My5ecretPassw0rd
#   # host: localhost
# ...
sudo -u git -H chmod o-rwx config/database.yml
cd /home/git/gitlab
sudo gem install charlock_holmes --version '0.6.9.4'
sudo -u git -H bundle install --deployment --without development test mysql aws
sudo -u git -H bundle exec rake gitlab:setup RAILS_ENV=production
# Do you want to continue (yes/no)?
# Type "yes"
sudo cp lib/support/init.d/gitlab /etc/init.d/gitlab
sudo chmod +x /etc/init.d/gitlab
sudo update-rc.d gitlab defaults 21
sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production
sudo service gitlab start
sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
# => NG! (Git version is old)
# Install Git 1.8.4 (on 2013-09-29)
sudo aptitude install python-software-properties
sudo apt-add-repository ppa:git-core/ppa
sudo aptitude update
sudo aptitude safe-upgrade
# Check again
sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
# => OK!

# 7. Nginx
sudo apt-get install nginx
sudo cp lib/support/nginx/gitlab /etc/nginx/sites-available/gitlab /home/git/gitlab
sudo ln -s /etc/nginx/sites-available/gitlab /etc/nginx/sites-enabled/gitlab
sudo service nginx restart

# Login
# email: admin@local.host
# password: 5iveL!fe

# Change default password
# Create a new user
# ... To be continued to normal usage like a GitHub

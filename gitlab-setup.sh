# ref.
#   http://gitlab.org/
#   http://gitlab.org/gitlab-ce/
#   https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md

# Ubuntu Server 12.04 amd64 on Sakura VPS 1G

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

# Go to home directory
cd /home/git
# Clone gitlab shell
sudo -u git -H git clone https://github.com/gitlabhq/gitlab-shell.git
cd gitlab-shell
# switch to right version
sudo -u git -H git checkout v1.7.1
sudo -u git -H cp config.yml.example config.yml
# Edit config and replace gitlab_url
# with something like 'http://domain.com/'
sudo -u git -H vim config.yml
##
# ...
# # Url to gitlab instance. Used for api calls. Should end with a slash.
#-gitlab_url: "http://localhost/"
#+gitlab_url: "http://my.domain.com/"
# 
# http_settings:
# ...
##
# Do setup
sudo -u git -H ./bin/install

# 5. Database
## choose PostgreSQL
# Install the database packages
sudo apt-get install -y postgresql-9.1 libpq-dev
# Login to PostgreSQL
sudo -u postgres psql -d template1
# Create a user for GitLab. (change $password to a real password)
template1=# CREATE USER git WITH PASSWORD 'My5ecretPassw0rd';
# Create the GitLab production database & grant all privileges on database
template1=# CREATE DATABASE gitlabhq_production OWNER git;
# Quit the database session
template1=# \q
# Try connecting to the new database with the new user
sudo -u git -H psql -d gitlabhq_production
gitlabhq_production=> \q

# 6. GitLab
## Clone the Source
cd /home/git
# Clone GitLab repository
sudo -u git -H git clone https://github.com/gitlabhq/gitlabhq.git gitlab
# Go to gitlab dir
cd /home/git/gitlab
# Checkout to stable release
sudo -u git -H git checkout 6-1-stable
## Configure it
# Copy the example GitLab config
sudo -u git -H cp config/gitlab.yml.example config/gitlab.yml
# Make sure to change "localhost" to the fully-qualified domain name of your
# host serving GitLab where necessary
sudo -u git -H vim config/gitlab.yml
##
# ...
#     ## Web server settings
#-    host: localhost
#+    host: my.domain.com
#     port: 80
# ...
##
# Make sure GitLab can write to the log/ and tmp/ directories
sudo chown -R git log/
sudo chown -R git tmp/
sudo chmod -R u+rwX  log/
sudo chmod -R u+rwX  tmp/
# Create directory for satellites
sudo -u git -H mkdir /home/git/gitlab-satellites
# Create directories for sockets/pids and make sure GitLab can write to them
sudo -u git -H mkdir tmp/pids/
sudo -u git -H mkdir tmp/sockets/
sudo chmod -R u+rwX  tmp/pids/
sudo chmod -R u+rwX  tmp/sockets/
# Create public/uploads directory otherwise backup will fail
sudo -u git -H mkdir public/uploads
sudo chmod -R u+rwX  public/uploads
# Copy the example Unicorn config
sudo -u git -H cp config/unicorn.rb.example config/unicorn.rb
# Enable cluster mode if you expect to have a high load instance
# Ex. change amount of workers to 3 for 2GB RAM server
sudo -u git -H vim config/unicorn.rb
## Change nothing
# Configure Git global settings for git user, useful when editing via web
# Edit user.email according to what is set in gitlab.yml
sudo -u git -H git config --global user.name "GitLab"
sudo -u git -H git config --global user.email "gitlab@localhost"
sudo -u git -H git config --global core.autocrlf input
## Configure GitLab DB settings
sudo -u git cp config/database.yml.postgresql config/database.yml
# Edit config/database.yml
sudo -u git -H vim config/database.yml
##
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
##
# Make config/database.yml readable to git only
sudo -u git -H chmod o-rwx config/database.yml
## Install Gems
cd /home/git/gitlab
sudo gem install charlock_holmes --version '0.6.9.4'
sudo -u git -H bundle install --deployment --without development test mysql aws
## Initialize Database and Activate Advanced Features
sudo -u git -H bundle exec rake gitlab:setup RAILS_ENV=production
# Do you want to continue (yes/no)?
# Type "yes"
## Install Init Script
sudo cp lib/support/init.d/gitlab /etc/init.d/gitlab
sudo chmod +x /etc/init.d/gitlab
sudo update-rc.d gitlab defaults 21
## Check Application Status
sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production
## Start Your GitLab Instance
sudo service gitlab start
## Double-check Application Status
sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production

# Git version is 1.7.9
# I have to upgrade to >= 1.7.10
# ref. http://d.hatena.ne.jp/orangeclover/20130120/1358640829
sudo aptitude install python-software-properties
sudo apt-add-repository ppa:git-core/ppa
sudo aptitude update
sudo aptitude safe-upgrade
# Git version 1.8.4 was installed

# check again
sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
# => OK!

# 7. Nginx
## Installation
sudo aapt-get install nginx
## Site Configuration
sudo cp lib/support/nginx/gitlab /etc/nginx/sites-available/gitlab /home/git/gitlab
sudo ln -s /etc/nginx/sites-available/gitlab /etc/nginx/sites-enabled/gitlab
## Restart
sudo service nginx restart

# Login
# email: admin@local.host
# password: 5iveL!fe

# Change default password
# Create a new user
# ... To be continued to normal usage like a GitHub

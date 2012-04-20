sudo aptitude update
sudo aptitude safe-upgrade
sudo aptitude install zsh vim byobu git-core curl build-essential
chsh -s /usr/bin/zsh
# configure or get .zshrc .vimrc .screenrc
# logout
# login

# Ruby with rbenv + ruby-build
#  https://github.com/sstephenson/rbenv
#  https://github.com/sstephenson/ruby-build
sudo aptitude install zlib1g-dev libssl-dev libreadline6-dev
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(rbenv init -)"' >> ~/.zshenv
exec $SHELL
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git
cd
rbenv install 1.9.3-p125
rbenv global 1.9.3-p125
gem install bundler --no-ri --no-rdoc
rbenv rehash

# install SQLite3
sudo aptitude install sqlite3 libsqlite3-dev

# install Rails with Bundler and test
echo 'source :rubygems' >> Gemfile
echo "gem 'rails', '3.2.2'" >> Gemfile
bundle install
bundle exec rails new sample
cd sample
echo "gem 'therubyracer'" >> Gemfile
bundle install
bundle exec rails g scaffold item name:string price:integer
bundle exec rake db:migrate
bundle exec rake
bundle exec rails s

# install PostgreSQL
sudo aptitude install postgresql-8.4 postgresql-server-dev-8.4

# Rails with PostgreSQL
bundle exec rails new pg_sample -d postgresql
cd pg_sample
bundle install

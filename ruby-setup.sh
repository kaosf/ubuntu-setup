# install Ruby with rbenv + ruby-build
# ref.
#   https://github.com/sstephenson/rbenv
#   https://github.com/sstephenson/ruby-build

# zlib1g-dev libssl-dev libreadline6-dev are needed to build
# libsqlite3-dev for SQLite3
# postgresql-server-dev-9.1 for PostgreSQL 9.1
# libxslt1-dev libxml2-dev for nokogiri
sudo aptitude install zlib1g-dev libssl-dev libreadline6-dev \
  libsqlite3-dev \
  postgresql-server-dev-9.1 \
  libxslt1-dev libxml2-dev

git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshenv
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv
exec $SHELL -l
mkdir -p $HOME/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
rbenv install 2.1.0
rbenv global 2.1.0
gem install bundler --no-ri --no-rdoc
rbenv rehash

# don't have to input "bundle exec"
# ref. http://qiita.com/ryurock/items/77542e00cbca5268e323
cd $HOME/.rbenv/plugins
git clone https://github.com/ianheggie/rbenv-binstubs.git

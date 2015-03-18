# Install Ruby with rbenv + ruby-build + rbenv-binstubs
# ref.
#   https://github.com/sstephenson/rbenv
#   https://github.com/sstephenson/ruby-build
#   http://qiita.com/ryurock/items/77542e00cbca5268e323
#   https://github.com/ianheggie/rbenv-binstubs

# zlib1g-dev libssl-dev libreadline6-dev are needed to build
# libsqlite3-dev for SQLite3
# postgresql-server-dev-9.3 for PostgreSQL 9.3
# libxslt1-dev libxml2-dev for nokogiri
sudo aptitude install zlib1g-dev libssl-dev libreadline6-dev libffi-dev \
  libsqlite3-dev \
  postgresql-server-dev-9.3 \
  libxslt1-dev libxml2-dev

git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshenv
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv
exec $SHELL -l
mkdir -p $HOME/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs.git $HOME/.rbenv/plugins/rbenv-binstubs
rbenv install 2.2.1
rbenv global 2.2.1
rbenv rehash
gem install bundler --no-ri --no-rdoc
rbenv rehash

# For ruby-ldap
# ref. https://github.com/bearded/ruby-ldap/issues/7
sudo aptitude install libldap2-dev libsasl2-dev
# For rmagic
sudo aptitude install libmagickwand-dev
locate MagickCore.pc # To find /usr/lib/x86_64-linux-gnu/pkgconfig
PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig \
  gem install rmagick -v 2.13.3
# For filemagic
sudo aptitude install libmagic-dev

# heroku toolbelt
# ref. https://toolbelt.heroku.com/
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

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
sudo aptitude install zlib1g-dev libssl-dev libreadline6-dev \
  libsqlite3-dev \
  postgresql-server-dev-9.3 \
  libxslt1-dev libxml2-dev

brew install rbenv ruby-build rbenv-binstubs
LATEST_VERSION=2.1.5
rbenv install $LATEST_VERSION
rbenv global $LATEST_VERSION
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

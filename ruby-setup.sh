# Install Ruby with rbenv + ruby-build + rbenv-binstubs
# ref.
#   https://github.com/sstephenson/rbenv
#   https://github.com/sstephenson/ruby-build
#   http://qiita.com/ryurock/items/77542e00cbca5268e323
#   https://github.com/ianheggie/rbenv-binstubs

# zlib1g-dev libssl-dev libreadline6-dev are needed to build
# libsqlite3-dev for SQLite3
# libxslt1-dev libxml2-dev for nokogiri
sudo apt-get -y install zlib1g-dev libssl-dev libreadline6-dev libffi-dev \
  libsqlite3-dev libxslt1-dev libxml2-dev

git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

mkdir -p $HOME/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs.git $HOME/.rbenv/plugins/rbenv-binstubs
rbenv install 2.3.1
rbenv global 2.3.1
rbenv rehash
gem install bundler --no-ri --no-rdoc
rbenv rehash

# For PostgreSQL
sudo apt-get -y install postgresql-server-dev-all
# For MySQL
sudo apt-get -y install libmysqlclient-dev
# For ruby-ldap
# ref. https://github.com/bearded/ruby-ldap/issues/7
sudo apt-get -y install libldap2-dev libsasl2-dev
# For rmagic
sudo apt-get -y install imagemagick libmagickwand-dev
locate MagickCore.pc # To find /usr/lib/x86_64-linux-gnu/pkgconfig
PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig \
  gem install rmagick -v 2.13.3
# For filemagic
sudo apt-get -y install libmagic-dev

# For zsh
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshenv
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.profile
echo 'eval "$(rbenv init -)"' >> $HOME/.profile

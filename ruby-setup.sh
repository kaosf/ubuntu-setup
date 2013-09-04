# install Ruby with rbenv + ruby-build
# ref.
#   https://github.com/sstephenson/rbenv
#   https://github.com/sstephenson/ruby-build
sudo aptitude install zlib1g-dev libssl-dev libreadline6-dev
git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshenv
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv
exec $SHELL -l
mkdir -p $HOME/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
gem install bundler --no-ri --no-rdoc
rbenv rehash

# to install nokogiri
sudo aptitude install libxslt-dev libxml2-dev
gem install nokogiri

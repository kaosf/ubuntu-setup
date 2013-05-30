# install Ruby with rbenv + ruby-build
# ref.
#   https://github.com/sstephenson/rbenv
#   https://github.com/sstephenson/ruby-build
sudo aptitude install zlib1g-dev libssl-dev libreadline6-dev
git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshenv
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv
exec $SHELL -l
mkdir -p $HOME/.rbenv/plugins
cd $HOME/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git
cd
rbenv install 2.0.0-p195
rbenv global 2.0.0-p195
gem install bundler --no-ri --no-rdoc
rbenv rehash

# setup ctags
# ref. http://qiita.com/items/4398a19c05ad4861af85
# install "ctags" before executing the following command
git clone https://github.com/taichouchou2/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
rbenv ctags

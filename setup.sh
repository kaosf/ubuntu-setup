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
rbenv rehash

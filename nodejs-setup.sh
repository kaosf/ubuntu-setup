# install Node.js with nodebrew
# ref. https://github.com/hokaccha/nodebrew

curl https://raw.github.com/hokaccha/nodebrew/master/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.zshenv
export PATH=$HOME/.nodebrew/current/bin:$PATH
# source $HOME/.zshenv

# nodebrew help
# nodebrew ls-all
nodebrew install 0.8.14
nodebrew use latest

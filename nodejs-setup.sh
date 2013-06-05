# install Node.js with nodebrew
# ref. https://github.com/hokaccha/nodebrew

curl https://raw.github.com/hokaccha/nodebrew/master/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.zshenv
export PATH=$HOME/.nodebrew/current/bin:$PATH

# nodebrew help
# nodebrew ls-all
nodebrew install-binary 0.8
nodebrew install-binary 0.10
nodebrew use latest

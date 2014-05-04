# ref. http://golang.org/doc/install
wget http://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
tar xzf go1.2.1.linux-amd64.tar.gz
mv go $HOME/.go
echo 'export GOROOT=$HOME/.go' >> $HOME/.zshenv
echo 'export PATH=$PATH:$GOROOT/bin' >> $HOME/.zshenv
echo 'export GOPATH=$HOME/.gocode' >> $HOME/.zshenv
echo 'export PATH=$HOME/.gocode/bin:$PATH' >> $HOME/.zshenv
source $HOME/.zshenv
rm -f go1.2.1.linux-amd64.tar.gz

# ref. https://github.com/heroku/hk#mac-os-x-linux-bsd
L=$HOME/local/bin/hk && curl -sL -A "`uname -sp`" https://hk.heroku.com/hk.gz | zcat >$L && chmod +x $L

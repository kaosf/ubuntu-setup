# ref. http://golang.org/doc/install
brew install go
cat <<EOS >> $HOME/.zshenv
export PATH=\$HOME/.linuxbrew/opt/go/libexec/bin:\$PATH
export GOPATH=\$HOME/.gocode
export PATH=\$HOME/.gocode/bin:\$PATH
EOS
source $HOME/.zshenv

# ref. https://github.com/heroku/hk#mac-os-x-linux-bsd
L=$HOME/local/bin/hk && curl -sL -A "`uname -sp`" https://hk.heroku.com/hk.gz | zcat >$L && chmod +x $L

# ref. https://github.com/peco/peco#go-get
go get github.com/peco/peco/cmd/peco

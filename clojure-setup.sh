# ref.
#  http://leiningen.org/#install
cd $HOME/local/bin
wget https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod +x lein
./lein

# ref.
#   https://github.com/icylisper/jark
#   http://gihyo.jp/book/2013/978-4-7741-5991-1 p.22
#   http://icylisper.github.io/jark
#   http://icylisper.github.io/jark/download.html
cd $HOME/local/bin
wget https://github.com/downloads/icylisper/jark/jark-0.4.4-Linux-x86_64.bin -O jark
chmod +x jark
jark server install
#jark server start
#jark vm stat
#jark repl
#jark server stop

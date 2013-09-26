wget http://www.kasahara.ws/lpm/lpm
chmod +x lpm
./lpm initlocaldir
#./lpm initlocaldir --local=$HOME/.lcl
rm lpm

tail -3 .zshrc >> .zshenv
head -$(($(cat .zshrc | wc -l) - 3)) .zshrc | tee .zshrc > /dev/null

# ref. http://www.kasahara.ws/lpm/quickstart_ja.html

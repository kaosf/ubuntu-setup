sudo apt-get -y install fontforge

cd
git clone git://github.com/yascentur/Ricty.git
cd Ricty
# Commit hash: 736be74127d97f9b653258e01bf82cc55e2468c4
#git checkout 736be74127d97f9b653258e01bf82cc55e2468c4
# or
#git checkout 4.0.1

# # Pattern 1
# wget http://levien.com/type/myfonts/Inconsolata.otf
# mkdir -p ~/.fonts
# cp Inconsolata.otf ~/.fonts/

# Pattern 2
wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf
#wget https://github.com/google/fonts/raw/883939708704a19a295e0652036369d22469e8dc/ofl/inconsolata/Inconsolata-Bold.ttf
wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf
#wget https://github.com/google/fonts/raw/883939708704a19a295e0652036369d22469e8dc/ofl/inconsolata/Inconsolata-Regular.ttf
# MD5:
# c6623d74820bb62d25c969a50bafbb46  Inconsolata-Bold.ttf
# b0639eb725c0df94f68b779889679457  Inconsolata-Regular.ttf

# # Pattern 3
# sudo apt-get -y install fonts-inconsolata

wget 'http://osdn.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F63545%2Fmigu-1m-20150712.zip' -O migu-1m-20150712.zip
unzip migu-1m-20150712.zip
cp migu-1m-20150712/migu-1m-bold.ttf ./
cp migu-1m-20150712/migu-1m-regular.ttf ./
# MD5:
# dd01b21af38f19e0f991637f7464a300  migu-1m-bold.ttf
# f8bfda7852a54bc6330f93b3c6a2adf6  migu-1m-regular.ttf

#wget https://raw.githubusercontent.com/yascentur/Ricty/736be74127d97f9b653258e01bf82cc55e2468c4/ricty_generator.sh
#chmod u+x ricty_generator.sh
#./ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf

./ricty_generator.sh auto
cp Ricty-*.ttf ~/.fonts/

cd ..

# ref.
#   http://mower.hateblo.jp/entry/2015/06/08/120918
#   https://github.com/yascentur/Ricty/
#   http://citrras.com/archives/1248

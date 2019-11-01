curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get -y install yarn
# ref. https://yarnpkg.com/en/docs/install#debian-stable
# Use wget instead of curl:
wget -q -O - https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

# Fix the version:
YARN_VERSION=1.19.1
wget https://github.com/yarnpkg/yarn/releases/download/v${YARN_VERSION}/yarn_${YARN_VERSION}_all.deb
sudo dpkg -i yarn_${YARN_VERSION}_all.deb
# ref. https://qiita.com/FumiyaShibusawa/items/627f0c806b49e364c3db

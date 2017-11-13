sudo apt-get -y install openjdk-8-jdk unzip

# Download sdkmanager
mkdir -p $HOME/local/android-sdk
cd $HOME/local/android-sdk
# ref. https://developer.android.com/studio/index.html
wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
unzip *.zip
rm -f *.zip

echo 'export ANDROID_HOME=$HOME/local/android-sdk' >> $HOME/.bashrc
echo 'export PATH=$HOME/local/android-sdk/tools/bin:$PATH' >> $HOME/.bashrc
export ANDROID_HOME=$HOME/local/android-sdk
export PATH=$HOME/local/android-sdk/tools/bin:$PATH

yes | sdkmanager 'platforms;android-27'
yes | sdkmanager 'build-tools;27.0.1'
yes | sdkmanager 'extras;android;m2repository'
# ... and more as you like

# How to check "sdkmanager '<here>'":
sdkmanager --list --verbose | grep -vP "^Info:|^\s|^$|^done$"
# ref. https://stackoverflow.com/a/42521077/1006253

# Install dependent packages for 64bit
# ref.
#   http://qiita.com/nichijo/items/773403a4bac7180a26ab
#   http://kokufu.blogspot.jp/2014/09/aapt-no-such-file-or-directory.html
sudo apt-get -y install lib32stdc++6 lib32z1

# for zsh
echo 'export ANDROID_HOME=$HOME/local/android-sdk' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk/tools/bin:$PATH' >> $HOME/.zshenv

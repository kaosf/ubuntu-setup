# Prerequesite
# Install OpenJDK 7
# ref. java-setup.sh

# Download android-sdk
[ -d $HOME/local ] || mkdir $HOME/local
cd $HOME/local
wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar xf android-sdk_r24.4.1-linux.tgz
rm -f android-sdk_r24.4.1-linux.tgz

echo 'export ANDROID_HOME=$HOME/local/android-sdk-linux' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/tools:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/platform-tools:$PATH' >> $HOME/.zshenv
export PATH=$HOME/local/android-sdk-linux/tools:$PATH
export PATH=$HOME/local/android-sdk-linux/platform-tools:$PATH

echo 'export PATH=$HOME/local/android-sdk-linux/build-tools/23.0.2:$PATH' >> $HOME/.zshenv
export PATH=$HOME/local/android-sdk-linux/build-tools/23.0.2:$PATH

# Install all tools (CAUTION: It takes too long time and too much storage space)
#android update sdk --no-ui --all

# Install specified version packages
# ref. http://stackoverflow.com/a/23196528/1006253
android update sdk --no-ui --all --filter xxxx,yyyy,zzzz
#android update sdk -u -a -t xxxx
#android update sdk -u -a -t xxxx,yyyy,zzzz

# Detect "xxxx", "yyyy" or "zzzz" by the following command:
android list sdk --no-ui --all --extended

# The minimal? packages:
android update sdk --no-ui --all --filter platform-tools,tools
android update sdk --no-ui --all --filter build-tools-25.0.0
#android update sdk --no-ui --all --filter build-tools-25.0.0,build-tools-24.0.3,build-tools-23.0.3,...
android update sdk --no-ui --all --filter android-25
#android update sdk --no-ui --all --filter android-25,android-24,android-23,...
android update sdk --no-ui --all --filter extra-android-support
android update sdk --no-ui --all --filter extra-android-m2repository
android update sdk --no-ui --all --filter extra-google-google_play_services

# GCM (obsolete)
android update sdk --no-ui --all --filter extra-google-gcm

#### My old style
## # ref. http://stackoverflow.com/questions/17963508/how-to-install-android-sdk-build-tools-on-the-command-line/19416222#19416222
## android update sdk --no-ui --all --filter X
## #android update sdk -u -a -t X
## #android update sdk -u -a -t X,Y,Z
##
## # Search "X" with following command;
## android list sdk --no-ui --all
##
## ## My minimal requirements for Android app building
## #
## # Android SDK Tools, revision x.y.z
## # Android SDK Platform-tools, revision x.y.z
## # Android SDK Build-tools, revision x.y.z
## # SDK Platform Android x.y.z, API ww, revision v
## # Android Support Repository, revision x
## # Android Support Library, revision x.y.z
## # Google Play services, revision x.y.z

# Install dependent packages for 64bit
# ref.
#   http://qiita.com/nichijo/items/773403a4bac7180a26ab
#   http://kokufu.blogspot.jp/2014/09/aapt-no-such-file-or-directory.html
sudo apt-get -y install lib32stdc++6 lib32z1

wget http://www-eu.apache.org/dist//ant/binaries/apache-ant-1.9.7-bin.tar.gz

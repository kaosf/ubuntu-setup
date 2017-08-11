wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz
tar xvf ffmpeg-release-64bit-static.tar.xz
sudo cp ./ffmpeg-*.*.*-64bit-static/ffmpeg /usr/local/bin
sudo cp ./ffmpeg-*.*.*-64bit-static/ffprobe /usr/local/bin
rm -rf ./ffmpeg-*.*.*-64bit-static ffmpeg-release-64bit-static.tar.xz

# Option
# sudo apt-get install nscd

# ref. https://www.johnvansickle.com/ffmpeg/
# ref. http://qiita.com/yayugu/items/d7f6a15a6f988064f51c

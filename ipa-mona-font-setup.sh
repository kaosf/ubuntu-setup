wget http://www.geocities.jp/ipa_mona/opfc-ModuleHP-1.1.1_withIPAMonaFonts-1.0.8.tar.gz
tar xzf opfc-ModuleHP-1.1.1_withIPAMonaFonts-1.0.8.tar.gz
mkdir -p $HOME/.fonts
cp opfc-ModuleHP-1.1.1_withIPAMonaFonts-1.0.8/fonts/*.ttf $HOME/.fonts
rm -rf opfc-ModuleHP-1.1.1_withIPAMonaFonts-1.0.8
fc-cache -f
#fc-list | grep IPA

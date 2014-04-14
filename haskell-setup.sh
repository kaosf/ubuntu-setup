sudo aptitude install haskell-platform

echo 'export PATH=$HOME/.cabal/bin:$PATH' >> $HOME/.zshenv
source $HOME/.zshenv

cabal update

# Pandoc
cabal install pandoc

# hsenv
# ref. http://qiita.com/hyone/items/52ef0e18fe599e81b523
cabal update
cabal install hsenv

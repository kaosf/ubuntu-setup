sudo aptitude install haskell-platform

echo 'export PATH=$HOME/.cabal/bin:$PATH' >> $HOME/.zshenv
source $HOME/.zshenv

cabal update

# Pandoc
cabal install pandoc

# Install tmux at first

sudo aptitude install w3m

cat <<EOF > $HOME/local/bin/browser-for-earthquakecli-on-tmux
#!/bin/bash

tmux new-window "w3m \${1}"
EOF
chmod +x $HOME/local/bin/browser-for-earthquakecli-on-tmux

if ! grep 'alias earthquakecli=' $HOME/.zshenv > /dev/null
then
  echo "alias earthquakecli='BROWSER=browser-for-earthquakecli-on-tmux earthquake'" >> $HOME/.zshenv
fi

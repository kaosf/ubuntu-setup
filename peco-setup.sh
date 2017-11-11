wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz
tar xf peco_linux_amd64.tar.gz
sudo cp peco_linux_amd64/peco /usr/local/bin
rm -rf peco_linux_amd64*

cat <<'EOF' >> ~/.bashrc
peco-select-history() {
  declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'
EOF

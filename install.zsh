#!/usr/bin/env zsh

cd "$HOME"

read "ZMAN_HOME? Set up ZMAN_HOME (default is \$HOME/.zman)?> "

ZMAN_HOME="${ZMAN_HOME:-$HOME/.zman}"

git clone https://github.com/pjmp/zman.git "$ZMAN_HOME"

echo "source $ZMAN_HOME/zman.zsh" >> ~/.zshrc

#!/usr/bin/env zsh

cd "$HOME"

read "ZMAN_HOME? Set up ZMAN_HOME (default is \$HOME/.zman)?> "

ZMAN_HOME="${ZMAN_HOME:-$HOME/.zman}"
ZMAN_LIBS="$ZMAN_HOME/libs"

git clone https://github.com/pjmp/zman.git "$ZMAN_HOME"

cd "$ZMAN_HOME"

curl --compressed -o- -L \
	https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh > "$ZMAN_LIBS"/completion.zsh

curl --compressed -o- -L \
	https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/key-bindings.zsh > "$ZMAN_LIBS"/key-bindings.zsh

echo "source $ZMAN_HOME/zman.zsh" >> ~/.zshrc

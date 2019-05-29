#!/usr/bin/env zsh

zman() {
	readonly ZMAN_HOME="${ZMAN_HOME:-"$HOME/.zman"}"
	readonly ZMAN_LIB=$ZMAN_HOME/lib

	help() {
		cat $ZMAN_HOME/help.txt
	}

	init() {
		# source all the files in `lib`
		source <(cat "$ZMAN_LIB"/*.zsh)
	}

	add() {
		git submodule add --progress "$@"
	}

	update() {
		git submodule foreach --recursive git pull
	}

	remove() {
		for module in "$@"; do
			git submodule deinit --force "$module"
			git rm -fr "$module"
			rm -rf .git/modules/"$module"
		done
	}

	use() {
		if [ -f "$ZMAN_HOME/$1" ]; then
			source "$ZMAN_HOME"/"$1"
		else
			echo "$module doesn't exist, please add it"
		fi
	}

	case "$1" in
		u|update)
			{ cd "$ZMAN_HOME" && update && cd - 1> /dev/null }
		;;

		a|add)
			shift
			{ cd "$ZMAN_HOME" && add "$@" && cd - 1> /dev/null }
		;;

		r|remove)
			shift
			{ cd "$ZMAN_HOME" && remove "$@" && cd - 1> /dev/null }
		;;

		use)
			shift
			use "$@"
		;;

		init)
			init
		;;

		help|*)
			help
		;;
	esac

	unfunction update
	unfunction add
	unfunction remove
	unfunction use
	unfunction init
	unfunction help
}

# check if we're being sourced and if true, start to initilize zman
[[ $ZSH_EVAL_CONTEXT =~ :file$ ]] && zman init

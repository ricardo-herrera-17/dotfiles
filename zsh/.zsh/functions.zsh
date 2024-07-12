#!/bin/zsh

# Create a new directory and enter it
mkd() {
	mkdir -p "$@" && cd "$_";
}

# Pretty print the result of a GET curl
cget() {
  curlie -v GET "$1" | jq . | bat -l json
}

# Determine size of a file or total size of a directory
fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}



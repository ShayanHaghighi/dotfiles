run(){
    eval "$@ &> /dev/null & disown"
    echo "$!"
}

ll(){
    eval "eza --group-directories-first --color=always --icons=always  -lh --git --sort=modified $@ | batcat"
}

lt(){
    eval "eza -T -L ${1:-15} --color=always --icons=always --git-ignore | batcat"
}
ltl(){
    eval "eza -Tlh -L ${1:-15} --color=always --icons=always --git-ignore | batcat"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

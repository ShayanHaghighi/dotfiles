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


source "$XDG_CONFIG_HOME/zsh/syntax-highlighting-theme.sh"

eval "$(zoxide init zsh)"

# fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.local/bin"
if [[ -z "$_zsh_syntax_highlighting_loaded" ]]; then
    source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    _zsh_syntax_highlighting_loaded=1
fi
eval "$(batman --export-env)"

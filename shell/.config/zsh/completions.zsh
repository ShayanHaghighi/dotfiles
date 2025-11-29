if [[ -z "$_zsh_autosuggestions_loaded" ]]; then
    source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
     _zsh_autosuggestions_loaded=1
fi

# too much for now, so disabling
#source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

#fpath=($XDG_CONFIG_HOME/zsh/plugins/zsh-completions/ $fpath)
rm -f "$ZDOTDIR/.zcompdump"; compinit

export HISTSIZE=10000000
export SAVEHIST=10000000
setopt inc_append_history
# Carapace completion
#zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
# zstyle ':completion:*' list-colors 'yes'
# zstyle ':completion:*' menu select
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' verbose yes

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
 #zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
 zstyle ':completion:*' menu select=2
source <(carapace _carapace)


fpath=($XDG_CONFIG_HOME/zsh/completions $fpath)



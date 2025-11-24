# Load plugins (guard against multiple sourcing)
if [[ -z "$_zsh_autosuggestions_loaded" ]]; then
    source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    export _zsh_autosuggestions_loaded=1
fi

if [[ -z "$_zsh_syntax_highlighting_loaded" ]]; then
    source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    export _zsh_syntax_highlighting_loaded=1
fi

# zsh-syntax-highlighting styles
export ZSH_HIGHLIGHT_STYLES=(
  default                          'fg=#CDD6F4'
  unknown-token                    'fg=#F38BA8'
  reserved-word                    'fg=#CBA6F7'
  alias                            'fg=#F5C2E7'
  builtin                          'fg=#89B4FA'
  function                         'fg=#B4BEFE'
  command                          'fg=#A6E3A1,bold'
  precommand                       'fg=#A6E3A1,underline'
  hashed-command                   'fg=#A6E3A1'
  path                             'fg=#89DCEB'
  globbing                         'fg=#F9E2AF'
  history-expansion                'fg=#FAB387'
  single-hyphen-option             'fg=#94E2D5'
  double-hyphen-option             'fg=#94E2D5'
  back-quoted-argument             'fg=#F38BA8'
  single-quoted-argument           'fg=#F2CDCD'
  double-quoted-argument           'fg=#F5E0DC'
  dollar-quoted-argument           'fg=#F5E0DC'
  assign                           'fg=#FAB387'
)

# too much for now, so disabling
#source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

fpath=(path/to/zsh-completions/src $fpath)
#rm -f "$ZDOTDIR/.zcompdump"; compinit

eval "$(zoxide init zsh)"

# fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Carapace completion
#zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*' list-colors 'yes'
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

source <(carapace _carapace)


# Shell options
set -o emacs

# dircolors for ls/grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

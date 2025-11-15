autoload -Uz compinit
compinit

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# some more ls aliases
alias la='ls -a'
alias l='ls'
alias ls='eza --group-directories-last --sort=Extension -1'
alias lt='eza -T -L 5 --git-ignore'
alias ll='eza --group-directories-last -l --git --sort=modified'

alias cat='batcat'
alias catp='batcat --paging=always'

alias fkill='kill -9 $(ps aux | fzf | awk "{print $2}")'

alias fcdr='fcd -r'
alias fcdra='fcd -r -a'
alias fcda='fcd -a'

alias python=python3
alias ...='cd ../..'
alias webstorm='gtk-launch webstorm.desktop'
alias idea='/home/shayan/Apps/idea-IU-252.27397.103/bin/idea'
alias copy='xclip -selection clipboard'
alias fd="fdfind"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Keybindings for word navigation and killing
bindkey '^[[1;5D' backward-word      # Ctrl+Left
bindkey '^[[1;5C' forward-word       # Ctrl+Right
bindkey '^H' backward-kill-word     # Ctrl+Backspace
bindkey '^[[3;5~' kill-word         # Ctrl+Delete
# Alt+Left (Move to the beginning of the current word)
bindkey '^[[1;3D' beginning-of-line

# Alt+Right (Move to the end of the current word)
bindkey '^[[1;3C' end-of-line

# Alt+Backspace (Backward kill word)
#bindkey '^[?b' backward-kill-line

# Alt+Delete (Kill word forward)
bindkey '^[[3;3~' kill-whole-line

CFG_DIR=/home/shayan/.config/

# setup eza themes
export EZA_ICONS_AUTO=always
export EZA_CONFIG_DIR="$CFG_DIR/eza"

# starship initialization
export STARSHIP_CONFIG="$CFG_DIR/starship.toml"

export VISUAL=nvim



#export PATH="$PATH:/home/shayan/.local/bin:/home/shayan/Apps/WebStorm-252.26830.93/bin/webstorm"
export PATH=/opt/cmake/bin:$PATH

export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json


export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:"/usr/local/go/bin"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
if [[ -z "$_zsh_autosuggestions_loaded" ]]; then
source "$HOME/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
export _zsh_autosuggestions_loaded=1
fi
source /usr/share/doc/fzf/examples/key-bindings.zsh

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
# Enable automatic completion highlighting
zstyle ':completion:*' list-colors 'yes'
# zstyle ':completion:*:default' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:*=(*)=36'
zstyle ':completion:*' menu select

if [[ -z "$_zsh_syntax_highlighting_loaded" ]]; then
  source /home/shayan/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export _zsh_syntax_highlighting_loaded=1
fi
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


set -o emacs

eval "$(starship init zsh)"

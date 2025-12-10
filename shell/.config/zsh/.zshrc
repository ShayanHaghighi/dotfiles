#zmodload zsh/zprof
# -----------------------------
# ~/.zshrc
# -----------------------------
[[ -o interactive ]] || exit 0

autoload -Uz compinit
compinit

# Enable completion system
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/completions.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/bindings.zsh"
autoload -Uz compinit
compinit
# Starship prompt
eval "$(starship init zsh)"





export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#zprof

# -----------------------------
# ~/.zshrc
# -----------------------------

# Enable completion system
autoload -Uz compinit
compinit

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/editing.zsh"
source "$ZDOTDIR/bindings.zsh"

# Starship prompt
eval "$(starship init zsh)"





# -----------------------------
# ~/.zshenv
# -----------------------------
skip_global_compinit=1
# Default Programs
export VISUAL=nvim
export BROWSER="firefox"


export PATH=/opt/cmake/bin:$PATH
export PATH=$PATH:"/usr/local/go/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export NVM_DIR="$HOME/.nvm"

export XDG_CONFIG_HOME="$HOME/.config/"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
export TMUX_CONF="$XDG_CONFIG_HOME/tmux/tmux.conf"

# ui themes
export EZA_ICONS_AUTO=always
# export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=1
echo "ran .zshenv"

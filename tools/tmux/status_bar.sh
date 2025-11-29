#!/bin/bash

source "$XDG_CONFIG_HOME/tmux/theme.sh"

sep_l=""
sep_r=""

build_module() {
    local color="$1"
    local icon="$2"
    local text="$3"
    
    echo "#[fg=${color},bg=default]${sep_l}#[fg=${thm_base},bg=${color}]${icon} #[fg=${thm_text},bg=${thm_surface0}] ${text}#[fg=${thm_surface0},bg=default]${sep_r}"
}

mod_git=$(build_module "$thm_peach" "󰊢" "#(gitmux -cfg $XDG_CONFIG_HOME/tmux/.gitmux.conf #{pane_current_path})")

mod_session=$(build_module "#{?client_prefix,$thm_red,$thm_green}" "" "#S ")

mod_date=$(build_module "$thm_red" "" "%H:%M")
mod_dir=$(build_module "$thm_red" "" "#(get-dir #{pane_current_path})")

tmux set -g status-left-length 100 
tmux set -g status-right-length 100 

tmux set -g status-bg "$thm_black"
tmux set -g status-right "${mod_git} ${mod_dir}"
tmux set -g status-left "${mod_session}     "

tmux setw -g window-status-format " 
#[fg=$thm_mauve,bg=default]$sep_l\
#[fg=$thm_base,bg=$thm_mauve]#I \
#[fg=$thm_text,bg=$thm_surface0] #W \
#[fg=$thm_surface0,bg=default]$sep_r"

tmux setw -g window-status-current-format " \
#[fg=$thm_blue,bg=default]$sep_l\
#[fg=$thm_base,bg=$thm_blue]#I \
#[fg=$thm_black,bg=$thm_blue,bold] #W \
#[fg=$thm_blue,bg=default]$sep_r"

tmux set -g status-bg "$thm_base"

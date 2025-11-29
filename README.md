This repository contains all my dotfiles. These files can be installed using stow:
```shell
cd dotfiles
stow -t=$HOME -Sv <packages>
```

TODO:
- fuzzy find cheat sheets by name
- don't save cheat sheet if not found by cht.sh
- make "root" note be stored in folder (as it might not be stored if folder exists)


# Installed packages:
- stow (apt)
- starship (curl install)
- carapace (manual, but curl/apt exists)
- init recursive submodules for zsh plugins
- fzf (apt)
- nvim (manual)
- eza (apt, but manual for higher version)
- tpm (command install)
- gitmux (manual/go)
- lazygit (manual for lower ubuntu versions)
- xclip (apt)
- zoxide (curl)

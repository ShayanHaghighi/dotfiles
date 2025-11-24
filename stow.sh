#!/bin/zsh
LINE=
while true; do
    IFS= read -r LINE
    if [ $? -ne 0 ] && [ -z "$LINE" ]; then
        break;
    fi
    if [ ! $LINE ]; then
        continue
    fi
    module_path=$(eval echo $LINE | cut -d '=' -f 1)
    target_path=$(eval echo $LINE | cut -d '=' -f 2-)
    if [ ! $module_path ]; then
        echo "line '$LINE' missing module name, skipping"
        continue
    fi

    if [ ! "${target_path%"${target_path#?}"}" = "/" ]; then
        target_path="$HOME/$target_path"
    fi

    if [ ! -d $module_path ]; then
        echo "module path not correct"
        continue
    fi
    dotfiles_dir=$(dirname "$0")
    if [ ! -d "${target_path}" ] && [ ! -L "${target_path}" ] ; then
        mkdir -p "$target_path"
    fi
    package_dir="."
    if [[ "$module_path" == */* ]]; then
        package_dir=$(dirname "$module_path")
    fi
    package_name=$(basename $module_path)
    echo "storing package '$package_name' in: $target_path"
    eval $(stow -S --dir=$package_dir --target=$target_path $package_name)


done < "config"

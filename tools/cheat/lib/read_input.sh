
read_input(){
    if [ -p /dev/stdin ]; then
        # Input is being piped in
        raw_input=$(cat)
    else
        raw_input="$1"
    fi

    # Ensure we actually have input
    if [ -z "$raw_input" ]; then
        read -p "Enter note >> " raw_input
    fi
    echo $raw_input | tr " " '+'
}

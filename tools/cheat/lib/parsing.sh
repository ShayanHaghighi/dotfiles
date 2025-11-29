#!/bin/bash
is_response_ok(){
    input_file="$1"

    result=""
    #TODO replace with grep
    if [[ $(grep "Invalid permissions string" "$input_file") ]]; then
        result="invalid"
    elif [[  $(grep "404 NOT FOUND" "$input_file") ]]; then
        result="invalid"
    elif [[   $(grep "Unknown topic." "$input_file") ]]; then
        result="unknown"
    fi
    echo $result
}

get_parts(){
    query="$1"
    base_topic="$query"
    sub_topic=":root"
    if [[ "$1" == */* ]]; then
        base_topic=$(dirname $query)
        sub_topic=$(basename $query)
    elif [[ "$query" == *~* ]]; then
        IFS='~' read -r base_topic sub_topic <<< "$query"
    fi
    echo "base_topic='$base_topic'; sub_topic='$sub_topic'"

}

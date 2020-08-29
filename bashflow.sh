#!/bin/bash

values_to_print=("tu tia en tanga 1" "2" "chupate una verga gil 3" )




first_line=""
second_line=""

add_separator () {
  #add a separator between end and close of word
  first_line+="+"
  second_line+="|"
}
add_next () {
  # add the next arrow between the separator
  spacer='    '
  #echo "$first_line ${spacer}"
  #printf '%b\n' "${spacer}blah blah"
  first_line+=$(printf '%b\n' "${spacer}")
  second_line+=" -> "
}
add_space () {
  # add the space between the separator and the word
  first_line+="-"
  second_line+=" "
}

add_letter () {
  str=$1
  cnt=${#str}
  # a loop for the word, and his leng, treat the word as array and
  # print base don position
  for ((i=0; i < cnt; i++)); do
    first_line+="-"
    second_line+=${str:$i:1}
  done

}

# var to get the last item in the array
last=$(( ${#values_to_print[*]} - 1 ))
# a counter to evaluate when is the last word in the array
counter=-1

for word in "${values_to_print[@]}"; do
  ((counter++))
  add_separator
  add_space
  add_letter "$word"
  add_space
  add_separator
  if  ! [[ $counter == $last ]]; then
    add_next
  fi

done

# https://www.cyberciti.biz/faq/bash-script-replace-spaces-string/
# replace "space" with space
echo "${first_line// / }"
echo $second_line
echo "${first_line// / }"

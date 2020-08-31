#!/bin/bash
input_file="input.csv"

first_line=""
second_line=""
#   %   IS USE AS SPACE DELIMITER

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


build_three_arrays () {
  # read file and get first values to array first_level_boxes
  first_level_boxes=()
  second_level_boxes=()
  third_level_boxes=()

  while IFS=";" read -r text subtext subsubtext; do
    len_text=${#text}
    if [[ len_text -ne 0 ]]; then
      first_level_boxes+=("$text")


      # BUILD SECOND LEVEL
      len_subtext=${#subtext}
      if [[ len_subtext -ne 0 ]]; then
        second_level_boxes+=("#")
        second_level_boxes+=("%|%$subtext%|%%%%")
      else
        for ((i=0; i < len_text; i++)); do
          second_level_boxes+=("%")
        done
        second_level_boxes+=("%%%%")

      fi


      # BUILD THIRD LEVEL
      len_subsubtext=${#subsubtext}
      if [[ len_subsubtext -ne 0 ]]; then
        third_level_boxes+=("#")
        third_level_boxes+=("%|%$subsubtext%|%%%%")
      else
        len_subtext=$((len_subtext + 9))
        for ((i=0; i < len_subtext; i++)); do
          third_level_boxes+=("%")
        done
        third_level_boxes+=("%%%%")
      fi
    fi


  done < $input_file




}

build_first_boxes () {
  # var to get the last item in the array
  last=$(( ${#first_level_boxes[*]} - 1 ))
  # a counter to evaluate when is the last word in the array
  counter=-1
  for word in "${first_level_boxes[@]}"; do
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

  echo "${first_line// / }"
  echo $second_line
  echo "${first_line// / }"



}

build_second_boxes () {
  #result=$1
  arrows1=$result
  #echo "$arrows1"

  arrows1=$(echo "${arrows1//[A-Za-z1-9, %|]/ }")
  arrows1=$(echo "${arrows1//[#]/|}")
  echo "$arrows1"
  echo "$arrows1"


  arrows2=$result



  top_result=$result
  #echo "$top_result"
  top_result=$(echo "${top_result//[A-Za-z1-9+, ]/-}")
  top_result=$(echo "${top_result//[|]/+}")
  top_result=$(echo "${top_result//[%]/ }")
  under_result=$top_result

  top_result=$(echo "${top_result//[#]/|}")
  echo "$top_result"

  # repalce % with spaces
  result=$(echo "${result//[%]/ }")
  # repalce # with spaces >
  result=$(echo "${result//[#]/>}")
  echo "${result// / }"

  under_result=$(echo "${under_result//[#]/ }")
  echo "$under_result"
}


# https://www.cyberciti.biz/faq/bash-script-replace-spaces-string/
# replace "space" with space

build_three_arrays
build_first_boxes

result=""
for word in "${second_level_boxes[@]}"; do
  result+="$word"
done
build_second_boxes
result=""
for word in "${third_level_boxes[@]}"; do
  result+="$word"
done
build_second_boxes

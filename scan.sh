#!/bin/bash
# Scan documents
# sequentially scan the arrays when doing the if/then statements
# add if blank, then remove parameter option
# add function to scan for availabile printers, return as numbered list, and ask for number
# change variables from print to scan (THIS IS FOR SCANNING DUMBASS)

printf "Scan parameters required (leave blank for 1st param):%b\n\n"

# user selects the format parameter
format_bool=false
format_array=("pnm" "tiff" "png" "jpeg")
printf "Which format? (${format_array[*]})%b\n"
while [ $format_bool = false ]
do
  read print_format
    if [ "$print_format" = "${format_array[0]}" ] || [ "$print_format" = "${format_array[1]}" ] || [ "$print_format" = "${format_array[2]}" ] || [ "$format_format" = "${format_array[3]}" ]
    then
      format_bool=true
      printf "Saving scan as .$print_format%b\n\n"
    else
      printf "Invalid format%b\n"
    fi
done

# user selects the mode parameter
mode_bool=false
mode_array=("gray" "color")
printf "Which mode? (${mode_array[*]})%b\n"
while [ $mode_bool = false ]
do
  read print_mode
    if [ "$print_mode" = "${mode_array[0]}" ] || [ "$print_mode" = "${mode_array[1]}" ]
    then
      mode_bool=true
      printf "Scanning in $print_mode mode%b\n\n"
    else
      printf "Invalid mode%b\n"
    fi
done

# user selects the resolution parameter
resolution_bool=false
resolution_array=("75" "100" "200" "300" "600" "1200")
printf "What dpi resolution? (${resolution_array[*]})%b\n"
while [ $resolution_bool = false ]
do
  read print_resolution
    if [ "$print_resolution" = "${resolution_array[0]}" ] || [ "$print_resolution" = "${resolution_array[1]}" ] || [ "$print_resolution" = "${resolution_array[2]}" ] || [ "$print_resolution" = "${resolution_array[3]}" ] || [ "$print_resolution" = "${resolution_array[4]}" ] || [ "$print_resolution" = "${resolution_array[5]}" ]
    then
      resolution_bool=true
      printf "Scanning at $print_resolution dpi%b\n\n"
    else
      printf "Invalid resolution%b\n"
    fi
done

# user selects the printer scanner source parameter
source_bool=false
source_array=("Flatbed" "ADF")
printf "Which source? (${source_array[*]})%b\n"
while [ $source_bool = false ]
do
  read print_source
    if [ "$print_source" = "${source_array[0]}" ] || [ "$print_source" = "${source_array[1]}" ]
    then
      source_bool=true
      printf "Scanning from the $print_source%b\n\n"
    else
      printf "Invalid source%b\n"
    fi
done


# user defines the path to save scan
printf "Where to save?%b\n"
read print_destination
eval print_destination=$print_destination
printf "Saving scan to $print_destination.$print_format%b\n\n"

# run scanimage with user defined parameters
scanimage -v -d escl:http://192.168.1.138:8080 --format="$print_format" --mode "$print_mode" --resolution "$print_resolution" --source "$print_source" > "$print_destination"

# scan success confirmation
printf "Successfully saved scan!%b\n"

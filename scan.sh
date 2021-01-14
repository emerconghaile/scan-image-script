#!/bin/bash
# script to take user parameter input and scan documents
# add if blank, then remove parameter option
# add function to scan for availabile printers, return as numbered list, and ask for number

printf "Scan parameters required (leave blank for 1st param):%b\n\n"

# user selects the format parameter
format_bool=false
format_array=("pnm" "tiff" "png" "jpeg")
printf "Which format? (${format_array[*]})%b\n"
while [ $format_bool = false ]
do
  read format_scan
    if [[ " ${format_array[@]} " =~ " $format_scan " ]]
    then
      format_bool=true
      printf "Saving scan as .$format_scan%b\n\n"
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
  read mode_scan
    if [[ " ${mode_array[@]} " =~ " $mode_scan " ]]
    then
      mode_bool=true
      printf "Scanning in $mode_scan mode%b\n\n"
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
  read resolution_scan
    if [[ " ${resolution_array[@]} " =~ " $resolution_scan " ]]
    then
      resolution_bool=true
      printf "Scanning at $resolution_scan dpi%b\n\n"
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
  read source_scan
    if [[ " ${source_array[@]} " =~ " $source_scan " ]]
    then
      source_bool=true
      printf "Scanning from the $source_scan%b\n\n"
    else
      printf "Invalid source%b\n"
    fi
done

# user defines the path to save scan
printf "Where to save?%b\n"
read print_destination
eval print_destination=$print_destination
printf "Saving scan to $print_destination.$format_scan%b\n\n"

# run scanimage with user defined parameters
scanimage -v -d escl:http://192.168.1.138:8080 --format="$format_scan" --mode "$mode_scan" --resolution "$resolution_scan" --source "$source_scan" > "$print_destination"

# add scan success confirmation
# if file exists, then success
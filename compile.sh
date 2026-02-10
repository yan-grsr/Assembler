#!/bin/bash

# Exit immediately if a command fails
set -e 

declare file_name
read -p "Enter the assembly file to compile and launch : " file_name

# Check if the file exist
if [ -f "$file_name" ]; then
    # Check if the file has the .asm extension
    if [ "${file_name##.*}" == "asm" ];then
        # Compile and launch the program
        nasm -f elf64 $file_name -o ${file_name%.*}.o
        ld ${file_name%.*}.o -o ${file_name%.*}
        ./${file_name%.*}
    else 
        echo "$file_name is not a .asm file."
    fi
else
    echo "$file_name doesn't exist."
fi
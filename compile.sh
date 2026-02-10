#!/bin/bash

# Exit immediately if a command fails
set -e 

declare file_path   
declare file_name

read -p "Enter the assembly file to compile and launch : " file_path

file_name=${file_path##*/}

# Check if the file exist
if [ ! -f "$file_path" ]; then
        echo "$file_path doesn't exist."
        exit 0
fi

# Check if the file has the .asm extension
if [ ! "${file_name##*.}" == "asm" ]; then
    echo "$file_name is not a .asm file."
    exit 0
fi

if [ ! -d "tmp" ]; then
    mkdir tmp
fi

# Compile
nasm -f elf64 $file_path -o tmp/${file_name%.*}.o
ld tmp/${file_name%.*}.o -o tmp/${file_name%.*}

# Delete the object file
rm tmp/${file_name%.*}.o 

# Run the program
./tmp/${file_name%.*}
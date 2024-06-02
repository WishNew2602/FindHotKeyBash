#!/bin/bash

# Prompt for the number of files
read -p "Enter the number of text files to create: " num_files

# Directory to store the files
output_dir="test_files"

# Create the directory if it doesn't exist
mkdir -p "$output_dir"

# Generate random content
generate_random_content() {
    local lines=$1
    for ((i = 1; i <= lines; i++)); do
        shuf -n 1 /usr/share/dict/words
    done
}

# Loop to create the specified number of files
for ((i = 1; i <= num_files; i++)); do
    # File name with zero-padded numbers (e.g., file_001.txt)
    file_name="${output_dir}/file_$(printf "%03d" $i).txt"
    
    # Add random content to the file
    generate_random_content 10 > "$file_name"
    
    echo "Created $file_name"
done

echo "Done! Created $num_files files in the $output_dir directory."


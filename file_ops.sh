#!/bin/bash

# Define directory and file name
DIR_NAME="MyFolder"
FILE_NAME="notes.txt"

# Create the directory
mkdir -p "$DIR_NAME"

# Navigate into it
cd "$DIR_NAME" || exit

# Create the file and write some text
echo "This is a test file containing sample text." > "$FILE_NAME"

# Display the contents
echo -e "\n📄 Contents of $FILE_NAME:"
cat "$FILE_NAME"


#!/bin/bash

# Defining the directories
MOVIE_DESTINATION="/var/lib/plexmediaserver/Library/Movies/"
SHOW_DESTINATION="/var/lib/plexmediaserver/Library/Shows/"

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Ask the user which directory to choose
echo -e "${GREEN}Choose a directory:${NC}"
echo -e "${GREEN}1) Movies${NC}"
echo -e "${GREEN}2) Shows${NC}"
read -p "Enter 1 or 2: " choice

# Set the directory based on the choice
if [ "$choice" -eq 1 ]; then
    DIRECTORY="$MOVIE_DESTINATION"
elif [ "$choice" -eq 2 ]; then
    DIRECTORY="$SHOW_DESTINATION"
else
    echo -e "${RED}Invalid choice. Exiting.${NC}"
    exit 1
fi

# List files in the chosen directory
echo -e "${GREEN}Listing files in the directory: $DIRECTORY${NC}"
files=("$DIRECTORY"*)  # Store all files in an array

# Display the filenames with numbers
for i in "${!files[@]}"; do
    filename=$(basename "${files[i]}")  # Get only the filename
    echo -e "${GREEN}$((i + 1)): $filename${NC}"
done

# Prompt the user to choose the numbers to delete
echo -n "Enter the numbers of the files to delete (e.g., 1-3;5-7): "
read file_choices

# Function to process the user's input
delete_files() {
    IFS=';' read -ra ranges <<< "$1"  # Split the input into ranges
    for range in "${ranges[@]}"; do
        if [[ $range =~ ^([0-9]+)-([0-9]+)$ ]]; then
            start=${BASH_REMATCH[1]}
            end=${BASH_REMATCH[2]}
            for ((i=start; i<=end; i++)); do
                if [[ "$i" -gt 0 && "$i" -le "${#files[@]}" ]]; then
                    echo -n "Are you sure you want to delete '${files[$((i - 1))]}'? (y/n): "
                    read confirm
                    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
                        rm -rf "${files[$((i - 1))]}"
                        echo -e "${GREEN}File '${files[$((i - 1))]}' deleted successfully!${NC}"
                    else
                        echo -e "${GREEN}Deletion canceled for '${files[$((i - 1))]}'.${NC}"
                    fi
                else
                    echo -e "${RED}Number $i is invalid. Ignoring.${NC}"
                fi
            done
        else
            echo -e "${RED}Invalid range format: $range. Ignoring.${NC}"
        fi
    done
}

# Call the function to delete the files
delete_files "$file_choices"

# List remaining files in the directory
echo -e "${GREEN}Remaining files in the directory: $DIRECTORY${NC}"
remaining_files=("$DIRECTORY"*)  # Update the list of files
for i in "${!remaining_files[@]}"; do
    filename=$(basename "${remaining_files[i]}")  # Get only the filename
    echo -e "${GREEN}$((i + 1)): $filename${NC}"
done

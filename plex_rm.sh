#!/bin/bash

# Defining the directories
MOVIE_DESTINATION="/var/lib/plexmediaserver/Library/Movies/"
SHOW_DESTINATION="/var/lib/plexmediaserver/Library/Shows/"

# Ask the user which directory to choose
echo "Choose a directory:"
echo "1) Movies"
echo "2) Shows"
read -p "Enter 1 or 2: " choice

# Set the directory based on the choice
if [ "$choice" -eq 1 ]; then
    DIRECTORY="$MOVIE_DESTINATION"
elif [ "$choice" -eq 2 ]; then
    DIRECTORY="$SHOW_DESTINATION"
else
    echo "Invalid choice. Exiting."
    exit 1
fi

# List files in the chosen directory
echo "Listing files in the directory: $DIRECTORY"
files=("$DIRECTORY"*)  # Store all files in an array

# Display the filenames with numbers
for i in "${!files[@]}"; do
    filename=$(basename "${files[i]}")  # Get only the filename
    echo "$((i + 1)): $filename"
done

# Prompt the user to choose a number
echo -n "Choose a number to delete the corresponding file: "
read file_choice

# Check if the choice is valid
if [[ "$file_choice" -gt 0 && "$file_choice" -le "${#files[@]}" ]]; then
    # Confirm deletion
    echo -n "Are you sure you want to delete '${files[$((file_choice - 1))]}'? (y/n): "
    read confirm

    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        # Delete the chosen file
        rm -rf "${files[$((file_choice - 1))]}"
        echo "File '${files[$((file_choice - 1))]}' deleted successfully!"
    else
        echo "Deletion canceled."
    fi
else
    echo "Invalid choice. No file was deleted."
fi

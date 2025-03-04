#!/bin/bash

GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# Destination directories
MOVIE_DESTINATION="/var/lib/plexmediaserver/Library/Movies/"
SHOW_DESTINATION="/var/lib/plexmediaserver/Library/Shows/"
MOVIE_SOURCE="./Downloads/Movies/"
SHOW_SOURCE="./Downloads/Shows/"

# Check if the destination directories exist
echo -e "${GREEN}Step 1: Checking if movie destination directory exists${NOCOLOR}"
if [ ! -d "$MOVIE_DESTINATION" ]; then
    echo "The movie destination directory does not exist: $MOVIE_DESTINATION"
    exit 1
fi

echo -e "${GREEN}Step 2: Checking if show destination directory exists${NOCOLOR}"
if [ ! -d "$SHOW_DESTINATION" ]; then
    echo "The show destination directory does not exist: $SHOW_DESTINATION"
    exit 1
fi

# Find and copy movie files
echo -e "${GREEN}Step 3: Finding and copying movie files${NOCOLOR}"
find "$MOVIE_SOURCE" -type f \( -iname "*.mkv" -o -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.wmv" \) -exec cp {} "$MOVIE_DESTINATION" \;

# Find and copy show files
echo -e "${GREEN}Step 4: Finding and copying show files${NOCOLOR}"
find "$SHOW_SOURCE" -type f \( -iname "*.mkv" -o -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.wmv" \) -exec cp {} "$SHOW_DESTINATION" \;

# Remove all contents from the movie source directory after copying
echo -e "${GREEN}Step 5: Removing all contents from the movie source directory${NOCOLOR}"
rm -rf "$MOVIE_SOURCE"/*

# Remove all contents from the show source directory after copying
echo -e "${GREEN}Step 6: Removing all contents from the show source directory${NOCOLOR}"
rm -rf "$SHOW_SOURCE"/*

echo -e "${GREEN}Step 7: Video files copied to Movies and TV Shows directories, and all contents removed from source directories successfully!${NOCOLOR}"

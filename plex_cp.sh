#!/bin/bash

# Destination directories
MOVIE_DESTINATION=""
SHOW_DESTINATION=""
MOVIE_SOURCE=""
SHOW_SOURCE=""

# Check if the destination directories exist
if [ ! -d "$MOVIE_DESTINATION" ]; then
    echo "The movie destination directory does not exist: $MOVIE_DESTINATION"
    exit 1
fi

if [ ! -d "$SHOW_DESTINATION" ]; then
    echo "The show destination directory does not exist: $SHOW_DESTINATION"
    exit 1
fi

# Find and copy movie files
find "$MOVIE_SOURCE" -type f \( -iname "*.mkv" -o -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.wmv" \) -exec cp {} "$MOVIE_DESTINATION" \;

# Find and copy show files
find "$SHOW_SOURCE" -type f \( -iname "*.mkv" -o -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.wmv" \) -exec cp {} "$SHOW_DESTINATION" \;

# Remove all contents from the movie source directory after copying
rm -rf "$MOVIE_SOURCE"/*

# Remove all contents from the show source directory after copying
rm -rf "$SHOW_SOURCE"/*

echo "Video files copied to Movies and TV Shows directories, and all contents removed from source directories successfully!"

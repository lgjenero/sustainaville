#!/bin/bash

# Directory for converted files
mkdir -p converted

# Loop over all mp3 files in the current directory
for file in *.mp3; do
    # Define the output filename
    output="converted/${file}"

    # Run ffmpeg command
    ffmpeg -i "$file" -acodec libmp3lame -ab 32k -ar 16000 "$output" < /dev/null

    echo "Processed $file -> $output"
done

echo "All files have been processed."

#!/bin/bash

# URL of the file to download
url="https://simplifier.net/guide/implementierungsleitfaden-isik-modul-dokumentenaustausch-stufe-3/$exportaszipui"

# Folder to save the downloaded files
download_folder="downloaded_files"

# Create the download folder if it doesn't exist
mkdir -p "$download_folder"

# Use curl to download the file and follow redirects, saving the file with the correct name
#-L: Follow redirects.
# -J: Save the file with the server-specified name or the last part of the URL.
curl -LJO "$url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    # Get the downloaded filename
    filename=$(ls -1 | grep "Implementierungsleitfaden*.zip" | head -n 1)
    
    # Move the downloaded file to the specified folder
    mv "$filename" "$download_folder/"

    echo "File downloaded successfully and saved to: $download_folder/$filename"
else
    echo "Error downloading the file."
fi
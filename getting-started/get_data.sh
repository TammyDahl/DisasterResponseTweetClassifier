#!/bin/env bash

# See if data has already been downloaded
if [ -e "data/" ]; then
    if [ ! -z "$(ls -A data/)" ]; then
        echo "Data already downloaded, exiting."
        exit
    fi
fi

# Make sure kaggle CLI installed
if [ ! command -v kaggle >/dev/null 2>&1 ]; then
    echo "Error: kaggle CLI is not installed."
    exit 1
fi

# Download the data
mkdir -p data/
kaggle competitions download -c nlp-getting-started

if [ ! -e "nlp-getting-started.zip" ]; then
    echo "Error: Issue occured during data download. Is kaggle signed in?"
    exit 2
fi

# Move data to data folder and cleanup
unzip nlp-getting-started.zip -d data/
rm nlp-getting-started.zip

echo "Data downloaded successfully, exiting."
exit

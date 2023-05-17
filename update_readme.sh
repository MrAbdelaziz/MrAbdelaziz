#!/bin/bash

# Get the last picture from NASA API
API_KEY="$NASA_API_KEY"  # Access the API key from the environment variable

# Download the image
IMAGE_URL=$(curl -s "https://api.nasa.gov/planetary/apod?api_key=$API_KEY" | jq -r '.url')

# Download the image
curl -s -o image.jpg "$IMAGE_URL"

# Copy the image to the repository directory
cp image.jpg MrAbdelaziz

# Replace the placeholder in the README with the image path
sed -i "s|!\[NASA Picture\](.*)|![NASA Picture](image.jpg)|g" MrAbdelaziz/README.md

# Commit and push the changes
git config --global user.email "elouahab.abdelaziz@gmail.com"
git config --global user.name "MrAbdelaziz"
git commit -am "Update README with the latest NASA picture"
git push

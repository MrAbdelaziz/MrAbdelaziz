#!/bin/bash

# Get the last picture from NASA API
IMAGE_URL=$(curl -s "https://api.nasa.gov/planetary/apod?api_key=UTxsLjgPTQZfCVXDaJ9GkWGtKZr4UYafK3C9t7g9" | jq -r '.url')

# Download the image
curl -s -o image.jpg "$IMAGE_URL"

# Copy the image to the repository directory
cp image.jpg MrAbdelaziz

# Replace the placeholder in the README with the image path
sed -i "s|!\[NASA Picture\](.*)|![NASA Picture](image.jpg)|g" MrAbdelaziz/README.md

# Commit and push the changes
git commit -am "Update README with the latest NASA picture"
git push

#!/bin/bash

set -e

echo "Beginning git hook configurations"

read -e -p "Enter the relative or absolute path to the target git directory: " path

if [[ ! -d "$path" ]]; then
    echo "Error: The specified path is not a valid directory."
    exit 1
fi

if [[ ! -d "$path/.git" ]]; then
    echo "Error: The specified directory is not a Git repository. It doesn't contain a .git directory."
    exit 1
fi

if [[ -d "$path/.githooks" ]]; then
    echo "Removing existing .githooks directory..."
    rm -rf "$path/.githooks"
fi

echo "Creating .githooks/ directory at target git directory: $path"
mkdir -p "$path/.githooks"

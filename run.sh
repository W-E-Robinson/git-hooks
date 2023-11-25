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

echo "Adding .githooks/ directory to .gitignore"
if [[ ! -e "$path/.gitignore" ]]; then
    echo "Creating .gitignore file"
    touch "$path/.gitignore"
fi
gitignore_file="$path/.gitignore"
echo ".githooks/" >> "$gitignore_file"

cd "$path" || exit 1

echo "Running: git config --local core.hooksPath .githooks/"
git config --local core.hooksPath .githooks/

echo "Creating pre-commit hook"
pre_commit_script="$path/.githooks/pre-commit"

echo "#!/bin/bash" > "$pre_commit_script"
echo "" >> "$pre_commit_script"
echo "echo \"Running pre-commit hook\"" >> "$pre_commit_script"

chmod +x "$pre_commit_script"

echo "Git hook configurations completed for the repository at: $path"

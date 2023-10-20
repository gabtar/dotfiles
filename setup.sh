#!/bin/sh

# Get selected options or all
if [ $# -eq 0 ]; then
    files=*/
    echo "No arguments supplied, installing all dotfiles"
else
    files=$@
    # TODO: check arguments are valid dotfiles config...
    echo "Installing: $@"
fi

for element in $files ; do
    dir=${element%/}
    echo "Found $dir"
    echo "Installing $dir..."
    
    stow --target=$HOME $dir 
done

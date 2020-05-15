#!/usr/bin/env bash

# Add here
FILES=(${HOME}/.config
       /etc/nixos/configuration.nix
      )
for i in "${FILES[@]}";
do
    rsync -avhz \
    	  --exclude "kitty-themes" \
    	  --copy-links \
    	  $i $(basename $i | sed 's/^\.//')
done

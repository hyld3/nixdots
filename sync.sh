#!/usr/bin/env bash

# Add here
FILES=(${HOME}/.config
       /etc/nixos/configuration.nix
      )
for i in "${FILES[@]}";
do
    rsync -avhz \
    	  --exclude={'kitty-themes','*chromium*','*glib-*','*gtk-*'} \
    	  --copy-links \
    	  $i $(basename $i | sed 's/^\.//')
done

git add .  &&
	git commit -m "." &&
		git push origin master

#!/bin/bash

cd ~/storage/shared/Obsidian/zettelkasten
git fetch && git pull
git add -A && git commit -am "vault backup: `date +'%Y-%m-%d %H:%M:%S'`"
git push

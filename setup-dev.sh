#!/bin/bash

echo 'Installing Jekyll...'
sudo apt install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler

cd ~/Git
if [ -d 'bravishkaskytano.github.io' ]; then
    git clone https://github.com/BravishkaSkytano/bravishkaskytano.github.io
fi


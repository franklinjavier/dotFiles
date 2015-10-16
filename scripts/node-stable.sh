#!/usr/bin/env bash

set -e

echo "Installing nvm..."
[ -d ~/.nvm ] && rm -rf ~/.nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
cd - >/dev/null
echo "...done" || echo "...failed" >&2

echo "Sourcing nvm..."
source ~/.nvm/nvm.sh
echo "...done" || echo "...failed" >&2

echo "Installing node stable..."
nvm install stable
nvm alias default stable
echo "...done" || echo "...failed" >&2

echo "Installing npm..."
npm install -g npm
echo "...done" || echo "...failed" >&2

#!/bin/bash

sudo chsh gitpod -s "$(which zsh)"

TMPDIR=$(mktemp -d)

CURRENT=$PWD

cd $TMPDIR

for script in ~/.dotfiles/scripts/*; do
    bash "$script"
done


cd $CURRENT

rm -rf $TMPDIR

exec /usr/bin/zsh

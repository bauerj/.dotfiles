#!/bin/bash

if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

here="$(dirname "$0")"

cp $here/files/.zshrc ~/
cp $here/files/.gitconfig ~/

if which wslpath > /dev/null 2>&1; then
  cp $here/files/.hyper.js $(wslpath $(cmd.exe /C "echo %USERPROFILE%") | tr -d " \t\n\r" ) 
fi

if [[ $(uname) == MSYS* ]]; then
  git config --global core.autocrlf input
fi

#!/bin/bash

if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]]; then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

here="$(dirname "$0")"

cp -rT $here/files/ ~/

if [[ $(uname) == MSYS* ]]; then
  git config --global core.autocrlf input
fi

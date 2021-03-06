#!/bin/bash

if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

here="$(dirname "$0")"

cp $here/files/.zshrc ~/
cp $here/files/.gitconfig ~/

sed -i 's/ZSH_THEME_TERM_TAB_TITLE_IDLE="%/ZSH_THEME_TERM_TAB_TITLE_IDLE="@%m: %/g' ~/.oh-my-zsh/lib/termsupport.zsh

if which wslpath > /dev/null 2>&1; then
  cp $here/files/.hyper.js $(wslpath $(cmd.exe /C "echo %USERPROFILE%") | tr -d " \t\n\r" )/AppData/Roaming/Hyper/
fi

if [[ $(uname) == MSYS* ]]; then
  git config --global core.autocrlf input
fi

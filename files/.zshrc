# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

if [[ $(uname) == MSYS* ]]; then
  py=$(dirname /c/python*/python)
  # Python
  export PATH=$PATH:$py/Scripts/:$py
  # Meld
  export PATH="$PATH:/c/Program Files (x86)/Meld"
  # GPG
  export PATH="$PATH:/C/Program Files (x86)/GnuPG/bin"
  # Theme
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir custom_git_fast)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
  POWERLEVEL9K_CUSTOM_GIT_FAST="get_git_branch"
  POWERLEVEL9K_CUSTOM_GIT_FAST_BACKGROUND="blue"
  POWERLEVEL9K_CUSTOM_GIT_FAST_FOREGROUND="yellow"
  function echotc() {
    echo -n 256
  }
else
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs root_indicator)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(os status battery time public_ip)
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(zsh-syntax-highlighting pip rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=nano

function get_git_branch() {
  if [[ -d .git ]]; then
    echo -n $'\uE220 '
    git symbolic-ref --short HEAD
  fi
}


which meld > /dev/null || echo "Meld not found"

function eu() {
  server="bauerj.eu"
  if [ -n "$1" ]; then
    server="$1.$server"
  fi
  ssh root@$server
}

# Speed up prompt
source ~/.zsh/git-prompt-status-sed.zsh

# OSX bash_profile

# Git completion & branch status
# https://github.com/git/git/tree/master/contrib/completion
source ~/.git-prompt.sh
[[ -s ~/.bashrc ]] && source ~/.bashrc

emoji() {
  emojis=("🍕 " "💩 " "🐶 " "🍣 " "🍔 " "🍪 " "🐳 ")
  echo ${emojis[$RANDOM % ${#emojis[@]} ]}
}

STARTCOLOR="\e[0;36m";
ENDCOLOR="\e[0m";

set_bash_prompt() {
  export PS1="$STARTCOLOR\d \t \u:\w\$(__git_ps1 ' (%s)') $ENDCOLOR\n$(emoji)  "
}

# Terminal prompt formatting
PROMPT_COMMAND=set_bash_prompt

# custom ls 
alias ls="ls -GpF" 
export CLICOLOR=1 
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# colored git diffs
alias gd='git diff --color'

# Postgres path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Autocomplete Makefile
complete -W "\`grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_-]*$//'\`" make

# Vertical docker ps
export DOCKER_FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"
alias dps='docker ps --format="$DOCKER_FORMAT"'

# pushtmp is similar to pushd but with a temp dir, popd afterwards like usual
alias pushtmp='pushd $(mktemp -d)'

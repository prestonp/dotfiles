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


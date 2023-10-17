# Environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH
export EDITOR=nvim
export BROWSER=open
export FZF_DEFAULT_OPTS='--border=rounded --margin=5% --color=dark --height 100% --reverse  --info=hidden --header-first'
# export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/,.git/}" --max-depth 5'
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
export PYTHONSTARTUP=$HOME/.config/.pythonstartup.py

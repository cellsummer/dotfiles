# Environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH
export EDITOR=nvim
export BROWSER=open
export FZF_DEFAULT_OPTS='
  --ansi
  --border=rounded 
  --margin=5% 
  --color=dark 
  --height 100% 
  --reverse 
  --info=hidden 
  --header-first 
  --bind "ctrl-k:execute(nvim {})+accept"
  --bind "ctrl-o:become(vim {})"
'
# export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'
export FZF_DEFAULT_COMMAND='
  rg --files 
  --follow 
  --no-ignore-vcs 
  --hidden 
  -g "!{node_modules/,.git/}" 
  --max-depth 5
'

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
export PYTHONSTARTUP=$HOME/.config/.pythonstartup.py
export PYENV_ROOT="$HOME/.pyenv"
export DUCKDB_PATH=$HOME/.local/bin/duckdb
export GOPATH=$HOME/.local/go
export PATH=$GOPATH/bin:$PATH
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# Environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH
export EDITOR=nvim
export FZF_DEFAULT_OPTS='
  --color=bg+:#202020,bg:#151515,spinner:#ffafaf,hl:#ff8700
  --color=fg:#dddddd,header:#ffaf5f,info:#ff8700,pointer:#ffafaf
  --color=marker:#ff5f87,fg+:#c6b6ee,prompt:#ff8700,hl+:#ff8700
  --color=border:#151515
  --multi
  --ansi
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
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/wfang/.zsh/completions:"* ]]; then export FPATH="/Users/wfang/.zsh/completions:$FPATH"; fi

# pnpm
export PNPM_HOME="/Users/wfang/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "/Users/wfang/.deno/env"

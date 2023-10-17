# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	e="$EDITOR" \
	b="$BROWSER" \
  glog="git log --graph --decorate --oneline" \
  gs="git status" \
  lps="ps ax | fzf"

alias \
  ipython="python3 -m IPython" \
  python="python3" \
  pip="pip3" \
  lazy="NVIM_APPNAME=LazyVim nvim" \
  chad="NVIM_APPNAME=NvChad nvim"
  # nvim="NVIM_APPNAME=AstroVim nvim" 

# fzf
# launch application
ap() {
  open -a "$(find /Applications -name '*app' -maxdepth 1 | sed 's|/Applications/||;s|\.app||' | fzf --preview=)"
}


# find notes
fn() {
  local dir
  dir=$(find ~/Notes -type f -maxdepth 2 2> /dev/null | fzf +m) && nvim "$dir"
}
# find repos
fr() {
  local dir
  dir=$(find ~/Repos -type d -maxdepth 1 2> /dev/null | fzf +m) && nvim "$dir"
}
# fd - including hidden directories
fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
f() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# Hugo serve to bind to 192.168.X.X instead of default
hugo_serve() {
  ipaddress=$(ifconfig | awk '/192.168/ {print $2}')
  hugo serve -D --bind $ipaddress --baseURL http://$ipaddress
}

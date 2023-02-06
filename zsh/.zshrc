setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HOME/.zhistory

# Exports
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
path+=('/Users/wfang/.local/bin')
path+=('/Users/wfang/.cargo/bin')
export PATH
EDITOR=lvim

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

# alias lvim=/Users/wfang/.local/bin/lvim
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	yt="youtube-dl --add-metadata -i" \
	yta="yt-dlp -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner" \
  trans="trans -t zh"

# Colorize commands when possible.
alias \
	ls="gls -hN --color=auto --group-directories-first" \
	ll="gls -lhN --color=auto --group-directories-first" \
	la="gls -lhNa --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	trem="transmission-remote" \
	YT="youtube-viewer" \
	sdn="shutdown -h now" \
	e="$EDITOR" \
	b="$BROWSER" \
	p="pacman" \
	xi="sudo xbps-install" \
	xr="sudo xbps-remove -R" \
	xq="xbps-query" \
	z="zathura" \
  cl="calcurse" \
  view="nvim -R" \
  up="python3 -m http.server" \
  glog="git log --graph --decorate --oneline" \
  gs='git status'

alias \
	lf="lfub" \
	magit="nvim -c MagitOnly" \
	ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" \
	weath="less -S ${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport"  \
  ipython="python3 -m IPython"

# fzf
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
fo() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $(brew --prefix)/Cellar/fzf/0.37.0/shell/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bindings
bindkey "^J" down-line-or-history
bindkey "^K" up-line-or-history
# bindkey "^N" history-search-forward # or you can bind it to the down key "^[[B"
# bindkey "^P" history-search-backward # or you can bind it to Up key "^[[A"
# autosuggest keybindings
# bindkey '^E' autosuggest-execute
bindkey '^E' autosuggest-accept

# prompt
eval "$(starship init zsh)"

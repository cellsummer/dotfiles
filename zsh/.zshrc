
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HOME/.zhistory
HISTDUP=erase
ZVM_INIT_MODE=sourcing

# opts
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

set -o autopushd

plug "$HOME/.config/zsh/aliasrc.zsh"
plug "$HOME/.config/zsh/exportrc.zsh"

plug "MAHcodes/distro-prompt"
# plug "$HOME/.fzf.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"

plug "zap-zsh/supercharge"
# plug "zap-zsh/fzf"
# plug "zap-zsh/zap-prompt"
# plug "romkatv/powerlevel10k"
plug "Aloxaf/fzf-tab"
plug "zap-zsh/exa"

# Load completions
autoload -Uz compinit && compinit

# completions
# source "$HOME/.local/share/zap/plugins/zsh-completions/zsh-completions.plugin.zsh"
# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#  zsh-vi-mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# pyenv
eval "$(pyenv init -)" 
# prompt
# eval "$(starship init zsh)"

#zoxide
eval "$(zoxide init --cmd cd zsh)"

# zellij
# eval "$(zellij setup --generate-auto-start zsh)"
#br
#source /Users/wfang/.config/broot/launcher/bash/br
# fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


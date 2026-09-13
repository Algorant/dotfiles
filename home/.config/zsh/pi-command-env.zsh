# Lightweight zsh environment for Pi's `!` / `!!` user shell commands.
#
# This file is sourced by the Pi pi-zsh-hook extension in a non-interactive zsh.
# Keep it fast and quiet: aliases/functions/path only, no prompts, completion,
# fastfetch, keybindings, fzf widgets, or other interactive startup code.

# Core paths used by common development commands.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
# Git shortcuts.
alias gs="git status"
alias ga="git add"
alias gl="git log --graph --oneline --decorate --stat @{u}..HEAD"
alias gls="git ls"
alias gcam="git commit -am"
alias gpo="git push origin"

# Enhanced commands.
alias ls="lsd -lS"
alias l="ls"
alias ll="lsd -l --group-dirs first"
alias la="lsd -la --group-dirs first"
alias cat="bat"
alias man="batman"
alias tree="tree -aC -I '.git'"
alias tr="tree -aC -L 2 -I '.git'"
alias duf="duf --only local"

# System helpers.
alias update="paru -Syu --noconfirm"

function cdl() {
	cd "$1" && ls
}

function mkcd() {
	mkdir -p "$1" && cd "$1"
}

# ZSH Configuration for AlgoDots

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

export ZDOTDIR="$HOME/.config/zsh"

# Core paths
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Tool paths
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
# WSL/Windows paths
export PATH="$PATH:/mnt/c/Windows/System32"
export PATH="$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0"

# General environment
export EDITOR="nvim"
export COLORTERM="truecolor"
export HYPRSHOT_DIR="$HOME/Pictures/screenshots"
export GPG_TTY="$(tty)"

# History
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=5000000
export SAVEHIST="$HISTSIZE"

setopt EXTENDED_HISTORY         # ':start:elapsed;command' format
setopt HIST_EXPIRE_DUPS_FIRST   # Remove duplicates first when trimming
setopt HIST_FIND_NO_DUPS        # Skip duplicate events in history search
setopt HIST_IGNORE_ALL_DUPS     # Remove older duplicate events
setopt HIST_IGNORE_DUPS         # Don't record duplicate events
setopt HIST_IGNORE_SPACE        # Ignore events starting with space
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate events
setopt SHARE_HISTORY            # Share history across sessions

HISTORY_IGNORE="mpv*"


# -----------------------------------------------------------------------------
# Tools
# -----------------------------------------------------------------------------

# Completion system
autoload -Uz compinit
compinit

# Manpages
eval "$(batman --export-env)"

# Key bindings
bindkey -e  # Emacs bindings

# Restore normal up-arrow behavior instead of autocomplete stealing it
() {
  local -a prefix=( '\e'{\[,O} )
  local -a up=( ${^prefix}A )
  local key

  for key in $up[@]; do
    bindkey "$key" up-line-or-history
  done
}

# Plugins
eval "$(zsh-patina activate)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
# fzf's zsh integration saves/restores all shell options. On this machine that
# includes the read-only `zle` option, which prints a harmless startup warning.
# Keep the integration enabled, but suppress that known warning locally.
source /usr/share/fzf/key-bindings.zsh 2> >(grep -v "can't change option: zle" >&2)
source /usr/share/fzf/completion.zsh 2> >(grep -v "can't change option: zle" >&2)
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="
  --color=bg+:-1,bg:-1,spinner:#83a598,hl:#928374
  --color=fg:-1,header:#928374,info:#8ec07c,pointer:#83a598
  --color=marker:#689d6a,fg+:#ebdbb2,prompt:#83a598,hl+:#83a598
  --height=60% --layout=reverse --border
"



# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gl="git log --graph --oneline --decorate --stat @{u}..HEAD"
alias gls="git ls"
alias gcam="git commit -am"
alias gpo="git push origin"
alias lg="lazygit"

# Enhanced commands
alias ls="lsd -lS"
alias l="ls"
alias ll="lsd -l --group-dirs first"
alias la="lsd -la --group-dirs first"
alias cat="bat"
alias man="batman"
alias tree="tree -aC -I '.git'"
alias tr="tree -aC -L 2 -I '.git'"
alias duf="duf --only local"
alias tt="tandem tui"
alias tw="tandem web"
alias dots='mise bootstrap dotfiles'

# System helpers
alias update="paru -Syu --noconfirm"


# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

function cdl() {
  cd "$1" && ls
}

function mkcd() {
  mkdir -p "$1" && cd "$1"
}

unalias nv 2>/dev/null
function nv() {
  local file

  file="$(
    fd --hidden --follow --exclude .git --type f |
      fzf --preview='bat --style=numbers --color=always --line-range=:500 -- {}'
  )" || return

  [[ -n "$file" ]] || return
  nvim -- "$file"
}


# -----------------------------------------------------------------------------
# Startup
# -----------------------------------------------------------------------------

fastfetch

# Prompt and shell integrations. Keep at the end of the file.
eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

. "$HOME/.cargo/env"

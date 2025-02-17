
export PATH="/usr/local/bin:/$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"

# history setup

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Setup zsh-autosuggestions
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# EZA config better ls
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ld="eza --color=always -D -G --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias lf="eza --color=always -a -f --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# Zoxide config better cd
eval "$(zoxide init zsh)"
alias cd="z"

# the fuck - this suggests promt corrections
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Bat
alias cat="bat"
export BAT_THEME="Catppuccin Mocha"

# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# fzf ignores... 
export FZF_DEFAULT_COMMAND="fd . $HOME"
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# This configures CTRL-T to use eza to show the files and bat for preview
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Starship as prompt
eval "$(starship init zsh)"


# Everything else
export NVM_DIR="$HOME/.custom-nvm-dir"
export NVM_COMPLETION=true
export JAVA_HOME=/usr/bin/java
export PATH=$JAVA_HOME/bin:$PATH 
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/home/username/miniconda/bin:$PATH"

# Conda
__conda_setup="$('/Users/rodrigoibarra/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rodrigoibarra/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rodrigoibarra/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rodrigoibarra/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# Posting Cli
. "$HOME/.local/bin/env"

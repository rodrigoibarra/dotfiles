# ── Path ──────────────────────────────────────────────────────────────────
export PATH="/usr/local/bin:$HOME/.bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/opt/tree-sitter/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/dotfiles/bin:$PATH"

# ── Terminal ──────────────────────────────────────────────────────────────
export TERM=tmux-256color
stty -ixon

# ── History ───────────────────────────────────────────────────────────────
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=9999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ── Completion ────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ── Plugins ───────────────────────────────────────────────────────────────
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── Aliases ───────────────────────────────────────────────────────────────
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ld="eza --color=always -D -G --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias lf="eza --color=always -a -f --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cat="bat"
alias fssh='ssh $(grep "^Host " ~/.ssh/config | grep -v "\*" | awk "{print \$2}" | fzf)'
alias organize-docs="python3 ~/dotfiles/utils/organize_documents.py"
# ── Bat ───────────────────────────────────────────────────────────────────
export BAT_THEME="Catppuccin Mocha"

# ── Zoxide ────────────────────────────────────────────────────────────────
eval "$(zoxide init zsh --cmd cd)"

# ── Thefuck ───────────────────────────────────────────────────────────────
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"

# ── fzf ───────────────────────────────────────────────────────────────────
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude node_modules --exclude .DS_Store"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude node_modules --exclude .DS_Store"

export FZF_DEFAULT_OPTS="
  --height 50%
  --layout reverse
  --border rounded
  --prompt '  '
  --pointer '▶'
  --marker '✓'
  --info inline
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
  --color=selected-bg:#45475a
  --color=border:#313244,label:#cdd6f4
"

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --line-range :500 {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

export FZF_ALT_C_OPTS="
  --preview 'eza --tree --color=always {} | head -200'
"

bindkey -s '^F' 'cd $(fd --type=d --hidden --exclude .git --exclude node_modules --exclude .DS_Store | fzf --preview "eza --tree --color=always {} | head -200")\n'

_fzf_compgen_path() {
  fd --hidden --exclude .git --exclude node_modules --exclude .DS_Store . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git --exclude node_modules --exclude .DS_Store . "$1"
}

_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"                         "$@" ;;
    ssh)          fzf --preview 'dig {}'                                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# ── Starship ──────────────────────────────────────────────────────────────
eval "$(starship init zsh)"

# ── Glow ──────────────────────────────────────────────────────────────
alias gl="glow"

# pnpm
export PNPM_HOME="/Users/rodrigoibarra/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

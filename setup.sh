#!/usr/bin/env bash
# ── setup.sh ──────────────────────────────────────────────────────────────
# Clean install script for rodrigoibarra/dotfiles
# Run from anywhere on a fresh macOS install:
#   curl -fsSL https://raw.githubusercontent.com/rodrigoibarra/dotfiles/main/setup.sh | bash
# Or clone first and run:
#   bash ~/dotfiles/setup.sh
# ──────────────────────────────────────────────────────────────────────────

set -e

DOTFILES="$HOME/dotfiles"
REPO="git@github.com:rodrigoibarra/dotfiles.git"
STOW_PACKAGES="nvim tmux zshrc bat gh ghostty starship thefuck antigen glow configstore"

# ── Colors ────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

info()    { echo -e "${BLUE}  →${NC} $1"; }
success() { echo -e "${GREEN}  ✓${NC} $1"; }
warning() { echo -e "${YELLOW}  ⚠${NC} $1"; }
error()   { echo -e "${RED}  ✗${NC} $1"; }
section() { echo -e "\n${BLUE}── $1 ${NC}$(printf '─%.0s' {1..50})\n"; }

# ── 1. Xcode CLI tools ────────────────────────────────────────────────────
section "Xcode CLI tools"
if xcode-select -p &>/dev/null; then
  success "Xcode CLI tools already installed"
else
  info "Installing Xcode CLI tools..."
  xcode-select --install
  echo "Press any key once installation is complete..."
  read -n 1
  success "Xcode CLI tools installed"
fi

# ── 2. Homebrew ───────────────────────────────────────────────────────────
section "Homebrew"
if command -v brew &>/dev/null; then
  success "Homebrew already installed"
else
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # add homebrew to PATH for apple silicon
  if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  success "Homebrew installed"
fi

# ── 3. Dotfiles repo ──────────────────────────────────────────────────────
section "Dotfiles"
if [ -d "$DOTFILES" ]; then
  success "Dotfiles already cloned at $DOTFILES"
else
  info "Cloning dotfiles repo..."
  git clone "$REPO" "$DOTFILES"
  success "Dotfiles cloned"
fi

cd "$DOTFILES"

# ── 4. Brew bundle ────────────────────────────────────────────────────────
section "Homebrew packages"
info "Trusting taps..."
brew trust jesseduffield/lazydocker 2>/dev/null || true
brew trust jesseduffield/lazygit 2>/dev/null || true

info "Running brew bundle..."
brew bundle --file="$DOTFILES/Brewfile"
success "Homebrew packages installed"

# ── 5. Stow dotfiles ──────────────────────────────────────────────────────
section "Stow symlinks"
cd "$DOTFILES"
for pkg in $STOW_PACKAGES; do
  if [ -d "$DOTFILES/$pkg" ]; then
    info "Stowing $pkg..."
    stow --restow "$pkg"
    success "$pkg stowed"
  else
    warning "$pkg folder not found, skipping"
  fi
done

# ── 6. npm globals ────────────────────────────────────────────────────────
section "npm globals"
npm_globals=(
  "@astrojs/language-server"
  "@olrtg/emmet-language-server"
  "eslint_d"
  "eslint"
  "typescript"
  "stylelint"
  "prettier-plugin-astro"
  "sfw"
)

for pkg in "${npm_globals[@]}"; do
  if npm list -g "$pkg" &>/dev/null; then
    success "$pkg already installed"
  else
    info "Installing $pkg..."
    sudo npm install -g "$pkg"
    success "$pkg installed"
  fi
done

# ── 7. Zsh as default shell ───────────────────────────────────────────────
section "Default shell"
ZSH_PATH="$(brew --prefix)/bin/zsh"
if [ "$SHELL" = "$ZSH_PATH" ]; then
  success "zsh already default shell"
else
  info "Setting zsh as default shell..."
  if ! grep -q "$ZSH_PATH" /etc/shells; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
  fi
  chsh -s "$ZSH_PATH"
  success "zsh set as default shell"
fi

# ── 8. tmux plugins ───────────────────────────────────────────────────────
section "tmux plugins"
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
  success "tpm already installed"
else
  info "Installing tpm..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  success "tpm installed"
fi

info "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins"
success "tmux plugins installed"

# ── 9. vscode-js-debug (DAP adapter) ─────────────────────────────────────
section "DAP adapter (vscode-js-debug)"
JS_DEBUG_PATH="$HOME/.local/share/nvim/dap/vscode-js-debug"
if [ -d "$JS_DEBUG_PATH" ]; then
  success "vscode-js-debug already installed"
else
  info "Installing vscode-js-debug..."
  mkdir -p "$HOME/.local/share/nvim/dap"
  git clone https://github.com/microsoft/vscode-js-debug "$JS_DEBUG_PATH"
  cd "$JS_DEBUG_PATH"
  npm install --legacy-peer-deps --ignore-scripts
  npx gulp vsDebugServerBundle
  mv dist out
  cd "$DOTFILES"
  success "vscode-js-debug installed"
fi

# ── 10. Neovim first launch ───────────────────────────────────────────────
section "Neovim plugins"
info "Bootstrapping lazy.nvim and installing plugins..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true
success "Neovim plugins installed"

# ── Done ──────────────────────────────────────────────────────────────────
section "Setup complete"
echo ""
echo -e "${GREEN}  Everything is installed. A few manual steps remaining:${NC}"
echo ""
echo "  1. Open tmux and press C-s I to verify tmux plugins"
echo "  2. Set up SSH keys for GitHub if on a new machine"
echo "  3. Configure Prompt/Ghostty to NOT auto-start tmux"
echo "  4. Install Python debugger when ready: pip install debugpy"
echo "  5. Run :Lazy sync inside nvim to verify all plugins"
echo "  6. source ~/.zshrc to load shell config"
echo ""

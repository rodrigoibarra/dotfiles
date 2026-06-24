# DRIPR
Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/rodrigoibarra/dotfiles/main/setup.sh | bash
```

Or clone and run manually:

```bash
git clone git@github.com:rodrigoibarra/dotfiles.git ~/dotfiles
bash ~/dotfiles/setup.sh
```

---

## Stack

### Shell
- **zsh** with autosuggestions, completions, syntax highlighting
- **[Starship](https://starship.rs/)** — minimal prompt (current dir, git branch/status, command duration)
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** — replaces `cd`
- **[thefuck](https://github.com/nvbn/thefuck)** — command correction (`fk`)
- **[fzf](https://github.com/junegunn/fzf)** — fuzzy finder (`Ctrl-T` files, `Ctrl-F` directories, `Ctrl-R` history)

### Terminal & Multiplexer
- **[Ghostty](https://ghostty.org/)** — terminal emulator
- **[tmux](https://github.com/tmux/tmux)** — multiplexer with Catppuccin Mocha theme

#### tmux keybindings
| Key | Action |
|-----|--------|
| `C-s` | prefix |
| `C-s \|` | vertical split |
| `C-s -` | horizontal split |
| `C-s r` | reload config |
| `C-s u` | open URLs (fzf-url) |
| `C-hjkl` | navigate panes / nvim splits |
| `S-Left/Right` | previous/next window |
| `C-s x` | close pane |

### Neovim
Built on [lazy.nvim](https://github.com/folke/lazy.nvim) with native Neovim 0.11+ LSP.

#### Plugin highlights
| Plugin | Role |
|--------|------|
| `mini.files` | file explorer (`<leader>e`) |
| `mini.pairs` | auto bracket/quote pairing |
| `mini.surround` | surround actions (`gsa`, `gsd`, `gsr`) |
| `mini.snippets` | snippet engine |
| `mini.diff` | git hunk signs in gutter |
| `mini.git` | git integration (`:Git`) |
| `blink.cmp` | completion engine |
| `fzf-lua` | file/text search |
| `nvim-treesitter` | syntax highlighting |
| `nvim-dap` | debugging (JS/TS) |
| `conform.nvim` | formatting |
| `nvim-lint` | linting |
| `catppuccin` | colorscheme (Mocha) |

#### Key bindings
| Key | Action |
|-----|--------|
| `<leader>e` | toggle file explorer |
| `<leader>ff` | find files |
| `<leader>fg` | live grep |
| `<leader>fr` | recent files |
| `<leader>fb` | buffers |
| `<leader>fw` | grep word under cursor |
| `<leader>gs` | git status |
| `<leader>gb` | git blame |
| `<leader>gd` | git diff |
| `<leader>ca` | code action |
| `<leader>rn` | rename symbol |
| `<leader>mp` | format file |
| `<leader>ml` | trigger linter |
| `<leader>db` | toggle breakpoint |
| `<leader>dc` | continue (debug) |
| `gd` | go to definition |
| `gr` | references |
| `K` | hover docs |
| `<S-h/l>` | prev/next buffer |

#### LSP servers (via Homebrew)
| Language | Server |
|----------|--------|
| JavaScript / TypeScript | `typescript-language-server` |
| HTML | `vscode-langservers-extracted` |
| CSS / SCSS | `vscode-langservers-extracted` |
| Python | `pyright` |
| Vue | `vue-language-server` |
| Tailwind | `tailwindcss-language-server` |
| Lua | `lua-language-server` |
| Astro | `@astrojs/language-server` (npm) |
| Emmet | `@olrtg/emmet-language-server` (npm) |

#### Per-project linting & formatting
Linting and formatting are configured per project. No global formatters enforced.

- **Formatting:** `conform.nvim` — uses `prettier` for web, `ruff` for Python, `stylua` for Lua
- **Linting:** `nvim-lint` — uses `eslint_d` for JS/TS/Vue/Astro, `stylelint` for CSS, `ruff` for Python

Each project should have its own `.eslintrc` / `stylelint.config.js` / `.prettierrc`.

### CLI Tools
| Tool | Purpose |
|------|---------|
| `bat` | `cat` replacement |
| `eza` | `ls` replacement |
| `fd` | `find` replacement |
| `ripgrep` | fast grep |
| `fzf` | fuzzy finder |
| `glow` | markdown TUI viewer |
| `bottom` | system monitor TUI (`btm`) |
| `lazygit` | git TUI |
| `lazydocker` | docker TUI |
| `gh` | GitHub CLI |
| `act` | run GitHub Actions locally |
| `jq` / `yq` | JSON/YAML processing |

### macOS Apps
- **[Alfred](https://www.alfredapp.com/)** — launcher
- **[AltTab](https://alt-tab-macos.netlify.app/)** — window switcher
- **[Rectangle](https://rectangleapp.com/)** — window management
- **[Transmit](https://panic.com/transmit/)** — file transfer
- **[Ghostty](https://ghostty.org/)** — terminal

---

## Manual steps after setup

1. Set up SSH keys for GitHub
2. Configure terminal to NOT auto-start tmux
3. Press `C-s I` in tmux to install plugins
4. Run `:Lazy sync` in nvim to verify plugins
5. Install Python debugger when ready: `pip install debugpy`

---

## Keyboards
Custom QMK configs for DZ60 and Agar boards.

---

> Personal config. Use as inspiration, not a blueprint.

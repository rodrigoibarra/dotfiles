# DRIPR
Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/rodrigoibarra/dotfiles/master/setup.sh | bash
```

Or clone and run manually:

```bash
git clone git@github.com:rodrigoibarra/dotfiles.git ~/dotfiles
bash ~/dotfiles/setup.sh
```

`setup.sh` installs Xcode CLI tools and Homebrew, clones this repo, runs `brew bundle` (apps and CLI tools), stows the packages, installs [mise](https://mise.jdx.dev/) and everything in `mise.toml` (runtimes and dev tools), then the remaining npm globals, tmux plugins, the JS debug adapter and the Neovim plugins. It is safe to re-run.

---

## Stack

### Shell
- **zsh** with autosuggestions, completions, syntax highlighting
- **[Starship](https://starship.rs/)** — minimal prompt (current dir, git branch/status, command duration)
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** — replaces `cd`
- **[fzf](https://github.com/junegunn/fzf)** — fuzzy finder (`Ctrl-T` files, `Ctrl-F` directories, `Ctrl-R` history)

### Runtimes & tools ([mise](https://mise.jdx.dev/))
Homebrew installs apps and CLI tools (`Brewfile`). mise installs runtimes and version-pinned dev tools (`mise.toml` in the repo root):

| Tool | Notes |
|------|-------|
| `node` (lts), `go`, `rust`, `pnpm` | language runtimes and package manager |
| `npm:typescript` (6.x) | pinned below 7: TS 7 dropped `tsserverlibrary.js`, which `astro-ls` needs |
| `npm:css-variable-lsp` | CSS variables LSP for Neovim |
| `delta` (`cargo:git-delta`) | built from source: the prebuilt aqua binary has no Intel macOS build |
| `difftastic` | prebuilt binary, provides `difft` |

- `mise install` (from `~/dotfiles`) installs everything in `mise.toml`; run `mise trust` once first
- `mise run bootstrap` runs `brew bundle` and stows all packages
- `.zshrc` activates mise with `eval "$(mise activate zsh)"`

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
| `mini.notify` / `mini.statusline` / `mini.icons` / `mini.indentscope` | notifications, statusline, icons, indent guides |
| `alpha-nvim` | start dashboard |
| `which-key.nvim` | keybinding hints |
| `twilight.nvim` | dim inactive code (`:Twilight`) |
| `render-markdown.nvim` | inline markdown rendering |
| `nvim-ts-autotag` | auto-close / rename HTML tags |
| `nvim-dap-ui` | debugger UI (`<leader>du`) |
| `friendly-snippets` | snippet collection |

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
| `<leader>w` / `<leader>q` / `<leader>Q` | write / quit / quit all |
| `<leader>o` | save and source current file |
| `<leader>bd` | close buffer |
| `<leader>nh` | clear search highlight |
| `<leader>y` | yank to system clipboard |
| `jk` | leave insert mode |
| `<A-j/k>` | move line / selection down / up |
| `<leader>fs` | grep current buffer |
| `<leader>fd` / `<leader>fi` | LSP definitions / references (fzf) |
| `<leader>fx` / `<leader>fX` | diagnostics: document / workspace |
| `<leader>fk` / `<leader>fh` / `<leader>fc` | search keymaps / help / commands |
| `<leader>gc` / `<leader>gB` | git commits / branches (fzf) |
| `<leader>gh` | toggle git hunk overlay |
| `<leader>dB` | conditional breakpoint |
| `<leader>di` / `<leader>do` / `<leader>dO` | step into / over / out |
| `<leader>dr` / `<leader>du` / `<leader>dx` | REPL / debugger UI / terminate |

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
| Go | `gopls` |
| Astro | `@astrojs/language-server` (npm) |
| Emmet | `@olrtg/emmet-language-server` (npm) |
| CSS variables (css, scss, less, astro) | `css-variable-lsp` (mise) |

#### Per-project linting & formatting
Linting and formatting are configured per project. No global formatters enforced.

- **Formatting:** `conform.nvim` — uses `prettier` for web, `ruff` for Python, `stylua` for Lua
- **Linting:** `nvim-lint` — uses `eslint_d` for JS/TS/Vue/Astro, `stylelint` for CSS, `ruff` for Python

Each project should have its own `.eslintrc` / `stylelint.config.js` / `.prettierrc`.

### Git & lazygit
- **Signed commits and tags** via SSH (`~/.ssh/id_ed25519.pub`, `allowed_signers`); credentials in the macOS keychain
- **[delta](https://github.com/dandavison/delta)** as pager: side-by-side, Catppuccin Mocha (`git/.config/git/catppuccin.gitconfig`)
- Histogram diffs, `zdiff3` merge conflicts, `rerere`, auto-stash rebases, `pull.ff = only`, `push.autoSetupRemote`
- **lazygit**: Catppuccin theme, delta pager (difftastic as an alternate), nvim as editor, auto-fetch, always-on graph log
- lazygit custom command `C` (files panel): conventional-commit prompt (type, optional scope, message)

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
| `delta` | git pager: side-by-side diffs, Catppuccin theme (installed with mise) |
| `difft` | structural diff, alternate pager in lazygit (installed with mise) |
| `ical-buddy` | calendar CLI (feeds SketchyBar) |
| `nowplaying-cli` | now-playing info (feeds SketchyBar) |

### macOS Apps
- **[Alfred](https://www.alfredapp.com/)** — launcher (import `alfred/Catppuccin-modern-frappe.alfredappearance` by hand)
- **[AltTab](https://alt-tab-macos.netlify.app/)** — window switcher
- **[Rectangle](https://rectangleapp.com/)** — window management (import `rectangle/RectangleConfig.json` in its settings)
- **[Transmit](https://panic.com/transmit/)** — file transfer
- **[SketchyBar](https://github.com/FelixKratz/SketchyBar)** — custom top bar (see below)

### SketchyBar
Thin (28px, blurred) top bar in Catppuccin colors (`colors.sh`):
- **Left:** active app
- **Right:** clock, next calendar event, now playing

Needs `sketchybar`, `ical-buddy`, `nowplaying-cli` and Hack Nerd Font (all in the Brewfile).

---

## Manual steps after setup

1. Set up SSH keys for GitHub
2. Configure terminal to NOT auto-start tmux
3. Press `C-s I` in tmux to install plugins
4. Run `:Lazy sync` in nvim to verify plugins
5. Install Python debugger when ready: `pip install debugpy`
6. If `~/.gitconfig` already exists as a real file, move it aside before stowing: stow won't link over it
7. Import the Rectangle and Alfred files by hand (they aren't stowed, see macOS Apps)

---

## Keyboards
Custom QMK configs for the BunnyCorne and Agar boards.

### BunnyCorne (Corne rev4.1, split 3x6 + thumbs)
Four layers: **0** base, **1** navigation (arrows, home/end, clipboard keys), **2** F-keys, symbols and RGB, **3** numpad.
- Right thumb key (tap dance): **hold** = Hyper (Ctrl+Shift+Alt+Cmd), **double-tap** = toggle the nav layer
- Left thumb key: double-tap returns to layer 0
- Media keys (mute, volume, play/pause) sit in the center columns
- Files: `keymap.c`, `config.h`, `rules.mk`, a Configurator export, SVG/PDF renders and a prebuilt `.uf2`

### Agar (KBDfans)
Layout JSON plus PNG renders of both layers.

---

## Homelab (coruscant)
`hlmini/` holds shell config for the `coruscant` server. It is **not stowed**: copy `zshrc-coruscant` to `~/.zshrc` and `zshenv-coruscant` to `~/.zshenv` on the server. It's a lightweight setup: history options, zsh-syntax-highlighting and fzf (loaded from their apt install paths), a few `ls`/`grep` aliases, `nano` as editor.

---

> Personal config. Use as inspiration, not a blueprint.

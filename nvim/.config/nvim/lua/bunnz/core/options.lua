local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- appearance
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.winborder = "rounded"
opt.conceallevel = 2 -- required for render-markdown.nvim

-- scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- splits
opt.splitright = true
opt.splitbelow = true

-- editing
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.undofile = true -- persistent undo across sessions

-- performance
opt.updatetime = 250 -- faster CursorHold events (LSP hover, diagnostics)
opt.timeoutlen = 300 -- faster which-key popup

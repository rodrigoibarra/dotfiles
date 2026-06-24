vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- ── General ───────────────────────────────────────────────────────────────
keymap.set("n", "<leader>o", ":update<CR>:source<CR>", { desc = "guardar y recargar" })
keymap.set("n", "<leader>w", ":write<CR>", { desc = "guardar" })
keymap.set("n", "<leader>q", ":quit<CR>", { desc = "cerrar" })
keymap.set("n", "<leader>Q", ":quitall<CR>", { desc = "cerrar todo" })
keymap.set("i", "jk", "<ESC>", { desc = "salir de insert mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "limpiar búsqueda" })

-- ── Window navigation (vim-tmux-navigator) ────────────────────────────────
keymap.set("n", "<C-h>", "<C-w>h", { desc = "ventana izquierda" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "ventana derecha" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "ventana abajo" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "ventana arriba" })

-- ── Buffers ───────────────────────────────────────────────────────────────
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "cerrar buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "buffer anterior" })
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "buffer siguiente" })

-- ── Move lines ────────────────────────────────────────────────────────────
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "mover línea abajo" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "mover línea arriba" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "mover selección abajo" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "mover selección arriba" })

-- ── Indenting ─────────────────────────────────────────────────────────────
keymap.set("v", "<", "<gv", { desc = "indentar izquierda" })
keymap.set("v", ">", ">gv", { desc = "indentar derecha" })

-- ── Clipboard ─────────────────────────────────────────────────────────────
keymap.set("v", "p", '"_dP', { desc = "pegar sin perder registro" })
keymap.set("n", "<leader>y", '"+y', { desc = "copiar al portapapeles" })
keymap.set("v", "<leader>y", '"+y', { desc = "copiar al portapapeles" })

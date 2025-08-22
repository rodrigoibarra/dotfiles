vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
keymap.set("n", "<leader>w", ":write<CR>")
keymap.set("n", "<leader>q", ":quit<CR>")
keymap.set("i", "jk", "<ESC>", { desc = "salir de insert mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "limpia la barra del buscador" })

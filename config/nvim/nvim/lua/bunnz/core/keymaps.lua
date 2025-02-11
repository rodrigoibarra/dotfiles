vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "salir de insert mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "limpia la barra del buscador" })

-- Utilities

keymap.set ("n", "<leader>+", "<C-a>", { desc = "aumenta el numero seleccionado" })
keymap.set ("n", "<leader>-", "<C-x>", { desc = "reduce el numero seleccionado" })

-- window management

keymap.set ("n", "<leader>sv", "<C-w>v", { desc = "parte la pantalla verticalmente"})
keymap.set ("n", "<leader>sh", "<C-w>h", { desc = "parte la pantalla horizontalmente"})
keymap.set ("n", "<leader>se", "<C-w>=", { desc = "parte la pantalla en partes iguales"})
keymap.set ("n", "<leader>sx", "<cmd>close<CR>", { desc = "cierra la particion seleccionada"})

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "abre nueva pestaña" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "cierra la pestaña activa" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "pestaña siguiente" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "pestaña anterior" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Abre el archivo actual en nueva pestaña" })

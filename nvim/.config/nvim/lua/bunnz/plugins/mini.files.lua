-- lua/plugins/mini-files.lua
return {
	"nvim-mini/mini.files",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		-- mini.files handles its own explorer, no need to disable netrw manually
		-- but use_as_default_explorer = true below covers directory opening
		require("mini.files").setup({
			content = {
				filter = function(entry)
					-- Filter out .DS_Store and node_modules (mirrors your nvim-tree custom filters)
					return entry.name ~= ".DS_Store" and entry.name ~= "node_modules"
				end,
				sort = function(entries)
					-- Case-sensitive sort (mirrors your nvim-tree sorter = "case_sensitive")
					table.sort(entries, function(a, b)
						return a.name < b.name
					end)
					return entries
				end,
			},
			windows = {
				preview = false,
				width_focus = 30, -- mirrors your nvim-tree width = 30
				width_nofocus = 15,
			},
			options = {
				use_as_default_explorer = true,
			},
		})

		-- Keymaps (mirrors your <leader>ee, <leader>eq, <leader>ef)
		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", function()
			require("mini.files").open()
		end, { desc = "Toggle file explorer" })

		keymap.set("n", "<leader>eq", function()
			require("mini.files").open()
		end, { desc = "Toggle file explorer" })

		keymap.set("n", "<leader>ef", function()
			-- Opens explorer focused on the current file
			require("mini.files").open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open file explorer on current file" })
	end,
}

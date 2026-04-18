-- lua/plugins/mini-files.lua
return {
	"nvim-mini/mini.files",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		require("mini.files").setup({
			content = {
				filter = function(entry)
					return entry.name ~= ".DS_Store" and entry.name ~= "node_modules"
				end,
				sort = function(entries)
					table.sort(entries, function(a, b)
						return a.name < b.name
					end)
					return entries
				end,
			},
			windows = {
				preview = false,
				width_focus = 30,
				width_nofocus = 15,
			},
			options = {
				use_as_default_explorer = true,
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", function()
			require("mini.files").open()
		end, { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>eq", function()
			require("mini.files").open()
		end, { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", function()
			require("mini.files").open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open file explorer on current file" })
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				vim.keymap.set("n", "<Enter>", function()
					require("mini.files").go_in()
				end, { buffer = args.data.buf_id, desc = "Open file / Enter directory" })
			end,
		})
	end,
}

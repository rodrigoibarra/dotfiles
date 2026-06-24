return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")

		-- custom button with no icon
		local function button(key, label, action)
			return {
				type = "button",
				val = label,
				on_press = function()
					local k = vim.api.nvim_replace_termcodes(action, true, false, true)
					vim.api.nvim_feedkeys(k, "tx", false)
				end,
				opts = {
					position = "center",
					shortcut = key,
					cursor = 1,
					width = 40,
					align_shortcut = "right",
					hl_shortcut = "AlphaShortcut",
					hl = "AlphaButtons",
				},
			}
		end

		local header = {
			type = "text",
			val = {
				"",
				"",
				os.date("  %A, %B %d, %Y"),
				"",
			},
			opts = {
				position = "center",
				hl = "AlphaHeader",
			},
		}

		local buttons = {
			type = "group",
			val = {
				button("n", "new file", ":ene <BAR> startinsert<CR>"),
				button("f", "find file", ":lua require('fzf-lua').files()<CR>"),
				button("r", "recent files", ":lua require('fzf-lua').oldfiles()<CR>"),
				button("g", "live grep", ":lua require('fzf-lua').live_grep()<CR>"),
				button("e", "file explorer", ":lua require('mini.files').open()<CR>"),
				button("l", "lazy", ":Lazy<CR>"),
				button("q", "quit", ":qa<CR>"),
			},
			opts = {
				spacing = 1,
			},
		}

		local config = {
			layout = {
				{ type = "padding", val = 8 },
				header,
				{ type = "padding", val = 2 },
				buttons,
			},
		}

		alpha.setup(config)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt_local.foldenable = false
				vim.opt_local.number = false
				vim.opt_local.relativenumber = false
				vim.opt_local.signcolumn = "no"
				vim.opt_local.statusline = " "
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}

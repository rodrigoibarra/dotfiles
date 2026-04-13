return {
	"nvim-lualine/lualine.nvim",

	dependencies = { "echasnovski/mini.icons" },

	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				theme = "catppuccin-nvim", -- correct
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}

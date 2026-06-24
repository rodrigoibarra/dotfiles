return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	ft = { "markdown", "mdx" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		enabled = true,
		render_modes = { "n", "c" },
		heading = {
			enabled = true,
			sign = false,
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
		},
		code = {
			enabled = true,
			sign = false,
			style = "full",
			border = "thin",
		},
		bullet = {
			enabled = true,
			icons = { "●", "○", "◆", "◇" },
		},
		checkbox = {
			enabled = true,
			unchecked = { icon = "󰄱 " },
			checked = { icon = "󰱒 " },
		},
		pipe_table = {
			enabled = true,
			style = "full",
		},
	},
}

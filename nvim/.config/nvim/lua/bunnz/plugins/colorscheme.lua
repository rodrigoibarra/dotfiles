return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				light = "mocha",
				dark = "mocha",
			},
			integrations = {
				blink_cmp = true,
				fzf = true,
				gitsigns = true,
				nvim_dap = true,
				nvim_dap_ui = true,
				render_markdown = true,
				treesitter = true,
				which_key = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

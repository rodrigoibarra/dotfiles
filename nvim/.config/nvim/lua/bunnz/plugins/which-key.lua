return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 300,
		icons = {
			mappings = true,
		},
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>d", group = "debug" },
			{ "<leader>g", group = "git" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>s", group = "search" },
			{ "g", group = "goto" },
			{ "[", group = "prev" },
			{ "]", group = "next" },
		},
	},
}

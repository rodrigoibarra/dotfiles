return {
	"echasnovski/mini.completion",
	version = false,
	dependencies = {
		"echasnovski/mini.icons",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local luasnip = require("luasnip")

		require("mini.icons").setup()
		require("luasnip.loaders.from_vscode").lazy_load()

		require("mini.completion").setup({
			delay = {
				completion = 100,
				info = 100,
				signature = 50,
			},
			window = {
				info = { height = 25, width = 80, border = "single" },
				signature = { height = 25, width = 80, border = "single" },
			},
			lsp_completion = {
				source_func = "completefunc",
				auto_setup = true,
			},
			fallback_action = "<C-x><C-n>",
			snippet_insert = function(snippet)
				luasnip.lsp_expand(snippet)
			end,
		})

		-- completion navigation keymaps
		vim.keymap.set("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<C-j>"]], { expr = true })
		vim.keymap.set("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true })
		vim.keymap.set("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { expr = true })
		vim.keymap.set("i", "<C-e>", [[pumvisible() ? "\<C-e>" : "\<C-e>"]], { expr = true })
		vim.keymap.set("i", "<C-Space>", "<cmd>lua MiniCompletion.complete_twostage()<CR>", { noremap = true })
	end,
}

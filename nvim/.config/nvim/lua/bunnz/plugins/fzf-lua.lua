return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	event = "VeryLazy",
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			winopts = {
				height = 0.85,
				width = 0.85,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				preview = {
					border = "rounded",
					scrollbar = false,
					layout = "flex",
					flip_columns = 120,
				},
			},
			fzf_opts = {
				["--layout"] = "reverse",
			},
			files = {
				fd_opts = "--type f --hidden --follow --exclude .git --exclude node_modules --exclude .DS_Store",
			},
			grep = {
				rg_opts = "--hidden --follow --glob '!.git' --glob '!node_modules' --column --line-number --no-heading --color=always --smart-case",
			},
		})

		-- ── Keymaps ───────────────────────────────────────────────────────────
		local map = vim.keymap.set

		-- files
		map("n", "<leader>ff", fzf.files, { desc = "buscar archivos" })
		map("n", "<leader>fr", fzf.oldfiles, { desc = "archivos recientes" })
		map("n", "<leader>fb", fzf.buffers, { desc = "buscar buffers" })

		-- search
		map("n", "<leader>fg", fzf.live_grep, { desc = "buscar en proyecto" })
		map("n", "<leader>fw", fzf.grep_cword, { desc = "buscar palabra bajo cursor" })
		map("n", "<leader>fs", fzf.grep_curbuf, { desc = "buscar en buffer actual" })

		-- lsp
		map("n", "<leader>fd", fzf.lsp_definitions, { desc = "definiciones LSP" })
		map("n", "<leader>fi", fzf.lsp_references, { desc = "referencias LSP" })
		map("n", "<leader>fx", fzf.diagnostics_document, { desc = "diagnósticos del archivo" })
		map("n", "<leader>fX", fzf.diagnostics_workspace, { desc = "diagnósticos del proyecto" })

		-- git
		map("n", "<leader>gc", fzf.git_commits, { desc = "git commits" })
		map("n", "<leader>gB", fzf.git_branches, { desc = "git branches" })

		-- misc
		map("n", "<leader>fk", fzf.keymaps, { desc = "buscar keymaps" })
		map("n", "<leader>fh", fzf.help_tags, { desc = "buscar ayuda" })
		map("n", "<leader>fc", fzf.commands, { desc = "buscar comandos" })
	end,
}

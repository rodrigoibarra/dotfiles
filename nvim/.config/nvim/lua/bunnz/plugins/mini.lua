return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- ── Files ───────────────────────────────────────────────────────────
		require("mini.files").setup({
			windows = {
				preview = true,
				width_focus = 30,
				width_preview = 50,
			},
			options = {
				use_as_default_explorer = true,
			},
			content = {
				filter = function(fs_entry)
					return fs_entry.name ~= ".DS_Store"
				end,
			},
		})

		vim.keymap.set("n", "<leader>e", function()
			if not require("mini.files").close() then
				require("mini.files").open(vim.api.nvim_buf_get_name(0))
			end
		end, { desc = "explorador de archivos" })

		-- ── Notify ──────────────────────────────────────────────────────────
		require("mini.notify").setup({
			window = {
				config = {
					border = "rounded",
				},
			},
		})
		vim.notify = require("mini.notify").make_notify()

		-- ── Pairs ───────────────────────────────────────────────────────────
		require("mini.pairs").setup()

		-- ── Surround ────────────────────────────────────────────────────────
		require("mini.surround").setup({
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		})

		-- ── Snippets ────────────────────────────────────────────────────────
		require("mini.snippets").setup({
			snippets = {
				require("mini.snippets").gen_loader.from_lang(),
			},
		})

		-- ── Statusline ──────────────────────────────────────────────────────
		require("mini.statusline").setup({
			use_icons = true,
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local filename = vim.fn.expand("%:t") -- just the filename
					local parent = vim.fn.expand("%:p:h:t") -- just the parent folder
					local filepath = parent .. "/" .. filename

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
						{ hl = "MiniStatuslineFilename", strings = { filepath } },
						"%<",
						"%=",
						{ hl = "MiniStatuslineFileinfo", strings = { filetype } },
					})
				end,
			},
		})

		-- ── Icons ───────────────────────────────────────────────────────────
		require("mini.icons").setup()

		-- ── Indentscope ─────────────────────────────────────────────────────
		require("mini.indentscope").setup({
			symbol = "│",
			options = {
				try_as_border = true,
			},
		})

		-- ── Diff ────────────────────────────────────────────────────────────
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = {
					add = "▎",
					change = "▎",
					delete = "",
				},
			},
		})

		-- ── Git ─────────────────────────────────────────────────────────────
		require("mini.git").setup()

		vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "git status" })
		vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "git blame" })
		vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<cr>", { desc = "git diff" })
		vim.keymap.set("n", "<leader>gh", function()
			require("mini.diff").toggle_overlay()
		end, { desc = "git hunk overlay" })
	end,
}

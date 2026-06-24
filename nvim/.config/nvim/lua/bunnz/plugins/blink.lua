return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"echasnovski/mini.snippets",
		"rafamadriz/friendly-snippets",
	},
	event = { "InsertEnter", "CmdlineEnter" },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- ── Keymaps ───────────────────────────────────────────────────────────
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		-- ── Appearance ────────────────────────────────────────────────────────
		appearance = {
			nerd_font_variant = "mono",
		},

		-- ── Snippets ──────────────────────────────────────────────────────────
		snippets = {
			preset = "mini_snippets",
		},

		-- ── Sources ───────────────────────────────────────────────────────────
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					async = true, -- prevents tailwindcss stutter
				},
			},
		},

		-- ── Completion ────────────────────────────────────────────────────────
		completion = {
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
				},
			},
			ghost_text = {
				enabled = true,
			},
		},

		-- ── Signature help ────────────────────────────────────────────────────
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		-- ── Fuzzy ─────────────────────────────────────────────────────────────
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},
}

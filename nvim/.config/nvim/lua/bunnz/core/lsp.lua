-- ── LSP keymaps (attached per buffer) ────────────────────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		map("gd", vim.lsp.buf.definition, "ir a definición")
		map("gD", vim.lsp.buf.declaration, "ir a declaración")
		map("gr", vim.lsp.buf.references, "ver referencias")
		map("gi", vim.lsp.buf.implementation, "ir a implementación")
		map("gy", vim.lsp.buf.type_definition, "ir a tipo")
		map("K", vim.lsp.buf.hover, "documentación")
		map("<leader>ca", vim.lsp.buf.code_action, "code action")
		map("<leader>rn", vim.lsp.buf.rename, "renombrar")
		map("<leader>d", vim.diagnostic.open_float, "ver diagnóstico")
		map("[d", vim.diagnostic.goto_prev, "diagnóstico anterior")
		map("]d", vim.diagnostic.goto_next, "diagnóstico siguiente")
	end,
})

-- ── Diagnostic display ────────────────────────────────────────────────────
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		border = "rounded",
	},
})

-- ── Server configurations ─────────────────────────────────────────────────
local servers = {
	ts_ls = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		},
	},

	html = {
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html" },
		root_markers = { "package.json", ".git" },
	},

	cssls = {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		root_markers = { "package.json", ".git" },
	},

	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
				},
			},
		},
	},

	astro = {
		cmd = { "astro-ls", "--stdio" },
		filetypes = { "astro" },
		root_markers = { "astro.config.mjs", "astro.config.ts", "package.json", ".git" },
	},

	volar = {
		cmd = { "vue-language-server", "--stdio" },
		filetypes = { "vue" },
		root_markers = { "vue.config.js", "nuxt.config.ts", "package.json", ".git" },
	},

	tailwindcss = {
		cmd = { "tailwindcss-language-server", "--stdio" },
		filetypes = {
			"html",
			"css",
			"scss",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"astro",
			"vue",
		},
		root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
		settings = {
			tailwindCSS = {
				experimental = {
					classRegex = {
						{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
						{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					},
				},
			},
		},
	},

	emmet_language_server = {
		cmd = { "emmet-language-server", "--stdio" },
		filetypes = {
			"html",
			"css",
			"scss",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"astro",
			"vue",
		},
		root_markers = { "package.json", ".git" },
	},

	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = vim.api.nvim_get_runtime_file("", true),
				},
				diagnostics = { globals = { "vim", "MiniStatusline" } },
				telemetry = { enable = false },
			},
		},
	},
}

-- ── Enable all servers ────────────────────────────────────────────────────
for name, config in pairs(servers) do
	vim.lsp.config(name, config)
	vim.lsp.enable(name)
end


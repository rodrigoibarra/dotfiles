return {
    "neovim/nvim-lspconfig",
    config = function()
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<leader>lf", vim.lsp.buf.format)
        vim.lsp.enable({ "lua_ls", "emmet-ls", "astro", "eslint", "stylelint_lsp" })

        local customizations = {
            { rule = "style/*",   severity = "off", fixable = true },
            { rule = "format/*",  severity = "off", fixable = true },
            { rule = "*-indent",  severity = "off", fixable = true },
            { rule = "*-spacing", severity = "off", fixable = true },
            { rule = "*-spaces",  severity = "off", fixable = true },
            { rule = "*-order",   severity = "off", fixable = true },
            { rule = "*-dangle",  severity = "off", fixable = true },
            { rule = "*-newline", severity = "off", fixable = true },
            { rule = "*quotes",   severity = "off", fixable = true },
            { rule = "*semi",     severity = "off", fixable = true },
        }


        local lspconfig = require("lspconfig")
        lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            filetypes = {
                "astro",
                "html",
                "markdown",
                "typescriptreact",
                "javascriptreact",
                "vue",
                "css",
                "sass",
                "scss",
                "less",
                "liquid",
            },
        })
        -- Enable eslint for all supported languages
        lspconfig.eslint.setup({
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescript.tsx",
                "vue",
                "html",
                "markdown",
                "json",
                "jsonc",
                "yaml",
                "toml",
                "xml",
                "astro",
            },
            settings = {
                -- Silent the stylistic rules in you IDE, but still auto fix them
                rulesCustomizations = customizations,
            },

            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })

        vim.lsp.config('stylelint_lsp', {
            filetypes = { "css", "less", "scss", "sugarss" }
        })
    end,
}

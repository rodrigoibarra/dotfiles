vim.lsp.config['eslint'] = {

    cmd = { 'vscode-eslint-language-server' },

    filetypes = {
        "javascript",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "vue",
        "markdown",
        "json",
        "yaml",
    },
    settings = {
        -- Silent the stylistic rules in your IDE, but still auto fix them
        rulesCustomizations = {
            { rule = 'style/*',   severity = 'off', fixable = true },
            { rule = 'format/*',  severity = 'off', fixable = true },
            { rule = '*-indent',  severity = 'off', fixable = true },
            { rule = '*-spacing', severity = 'off', fixable = true },
            { rule = '*-spaces',  severity = 'off', fixable = true },
            { rule = '*-order',   severity = 'off', fixable = true },
            { rule = '*-dangle',  severity = 'off', fixable = true },
            { rule = '*-newline', severity = 'off', fixable = true },
            { rule = '*quotes',   severity = 'off', fixable = true },
            { rule = '*semi',     severity = 'off', fixable = true },
        }
    },
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,

}

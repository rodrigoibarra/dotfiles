vim.lsp.config['stylelint_lsp'] = {
    cmd = { "stylelint-lsp", "--stdio" },
    filetpes = { "astro", "css", "html", "less", "scss" },
    root_markers = { ".stylelintrc", ".stylelintrc.mjs", ".stylelintrc.cjs", ".stylelintrc.js", ".stylelintrc.json", ".stylelintrc.yaml", ".stylelintrc.yml", "stylelint.config.mjs", "stylelint.config.cjs", "stylelint.config.js" },
}

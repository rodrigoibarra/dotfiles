vim.lsp.config['css_variables'] = {

    cmp = { "css-variables-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    settings = {
        {
            cssVariables = {
                blacklistFolders = { "**/.cache", "**/.DS_Store", "**/.git", "**/.hg", "**/.next", "**/.svn", "**/bower_components", "**/CVS", "**/dist", "**/node_modules", "**/tests", "**/tmp" },
                lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" }
            }
        }
    }

}

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "mocha",
                dark = "mocha",
            },
            integrations = {
                cmp = true,
                nvimtree = true,
                telescope = {
                    enabled = true,
                },
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end
}

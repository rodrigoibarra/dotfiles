return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = vim.split(
            [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣬⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣥⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣾⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣷⡀⠀⠀⠀⠀
⠀⠀⠀⢠⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⡄⠀⠀⠀
⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀
⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀
⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
            "\n",
            {}
        )
        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("spc ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("spc fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("spc ff", "󰈞  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
            dashboard.button("spc fr", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),

        }

        alpha.setup(dashboard.opts)

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,

}

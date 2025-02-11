return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require ("alpha")
    local dashboard = require ("alpha.themes.dashboard")


    -- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
    dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "spc ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
    dashboard.button( "spc fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    dashboard.button( "spc ff", "󰈞  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "spc fr", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),

  }

  alpha.setup(dashboard.opts)

  vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,


  }

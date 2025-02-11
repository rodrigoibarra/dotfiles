return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function ()
    vim.o.timeout = tree
    vim.o.timeoutlen = 500
  end,
  opts = {
    

  }

}

local M = {}

function M.configure(use, keymap)
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  require("trouble").setup({})

  -- x namespace: tools for vim itself
  keymap('', '<c-e>', ':TroubleToggle<cr>', silent)
end

return M

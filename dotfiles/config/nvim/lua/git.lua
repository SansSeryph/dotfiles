local M = {}

function M.configure(use)
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  require('gitsigns').setup()
end

return M

local M = {}

function M.configure(use)
  use 'dracula/vim'
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('catppuccin').setup({ term_colors = true })
    end,
  }

  vim.cmd[[colorscheme catppuccin]]
end

return M

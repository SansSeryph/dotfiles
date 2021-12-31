local M = {}

function M.configure(use)
  use 'dracula/vim'
  use { 'catppuccin/nvim', as = 'catppuccin' }

  require('catppuccin').setup({
    term_colors = true,
    integrations = {
      treesitter = true,
      telescope = true,
      markdown = true,
    },
  })

  vim.cmd[[colorscheme catppuccin]]
end

return M

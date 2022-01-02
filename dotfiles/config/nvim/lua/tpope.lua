local M = {}

function M.configure(use, keymap)
  use 'tpope/vim-fugitive'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-rake'
  use 'tpope/vim-bundler'
  use 'tpope/vim-rails'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-repeat'
  use 'tpope/vim-endwise'
  use 'tpope/vim-apathy'
  use 'tpope/vim-rhubarb'

  keymap('n', '<leader>g', '<Cmd>Git<CR>', silent)
end

return M

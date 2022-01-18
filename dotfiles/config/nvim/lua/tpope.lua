local M = {}

function M.configure(use, keymap)
  use 'tpope/vim-apathy'
  use 'tpope/vim-bundler'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-obsession'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-rails'
  use 'tpope/vim-rake'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  -- g namespace: git
  keymap('n', '<leader>gg', '<Cmd>Git<CR>', {})
  keymap('n', '<leader>gss', '<Cmd>Git switch staging<CR>', {})
  keymap('n', '<leader>grs', '<Cmd>Git reset --soft HEAD^<CR>', {})
  keymap('n', '<leader>gsc', '<Cmd>Git stash --include-untracked<CR>', {})
  keymap('n', '<leader>gsp', '<Cmd>Git stash pop<CR>', {})
  keymap('n', '<leader>gmy', '<Cmd>Git mergetool -y<CR>', {})
end

return M

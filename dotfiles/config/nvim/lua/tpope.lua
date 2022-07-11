local M = {}

function M.configure(use, keymap)
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-sleuth' }
  use { 'tpope/vim-dadbod' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-sensible' }
  use { 'tpope/vim-obsession' }
  use { 'tpope/vim-markdown' }
  use { 'tpope/vim-characterize' }
  use { 'tpope/vim-rake' }
  use { 'tpope/vim-apathy' }
  use { 'tpope/vim-rsi' }
  use { 'tpope/vim-eunuch' }
  use { 'tpope/vim-classpath' }
  use { 'tpope/vim-tbone' }

  use {
    'tpope/vim-unimpaired',
    requires = { { 'tpope/vim-repeat' } }
  }

  use {
    'tpope/vim-surround',
    requires = { { 'tpope/vim-repeat' } }
  }

  use {
    'tpope/vim-rhubarb',
    requires = { { 'tpope/vim-fugitive' } }
  }

  use {
    'tpope/vim-rails',
    requires = {
      { 'tpope/vim-abolish' },
      { 'tpope/vim-bundler' },
      { 'tpope/vim-dispatch' },
      { 'tpope/vim-dadbod' },
    }
  }

  use {
    'tpope/vim-dotenv',
    requires = {
      { 'tpope/vim-projectionist' },
      { 'tpope/vim-dispatch' },
    }
  }

  -- g namespace: git (requires fugitive)
  keymap('n', '<leader>gg',  '<Cmd>Git<CR>', {})
  keymap('n', '<leader>grc', '<Cmd>Git rebase --continue<CR>', {})
  keymap('n', '<leader>gra', '<Cmd>Git rebase --abort<CR>', {})
  keymap('n', '<leader>gss', '<Cmd>Git switch staging<CR>', {})
  keymap('n', '<leader>grs', '<Cmd>Git reset --soft HEAD^<CR>', {})
  keymap('n', '<leader>gsc', '<Cmd>Git stash --include-untracked<CR>', {})
  keymap('n', '<leader>gsp', '<Cmd>Git stash pop<CR>', {})
  keymap('n', '<leader>gmy', '<Cmd>Git mergetool -y<CR>', {})
end

return M

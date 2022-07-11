local M = {}

function M.configure(use, keymap)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      { 'andymass/vim-matchup' },
      { 'drybalka/tree-climber.nvim' },
      { 'nvim-treesitter/nvim-treesitter-context' },
      { 'nvim-treesitter/nvim-treesitter-refactor' },
      { 'RRethy/nvim-treesitter-endwise' },
      { 'windwp/nvim-ts-autotag' },
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        autotag = { enable = true },
        endwise = { enable = true },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
        matchup = { enable = true },

        refactor = {
          enable = true,
          clear_on_cursor_move = true,
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },

          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          }
        }
      })

      vim.w.foldmethod = 'expr'
      vim.w.foldexpr = 'nvim_treesitter#foldexpr()'

      require('treesitter-context').setup({ enable = true })
    end
  }

  local keyopts = { noremap = true, silent = true }
  local tree_climber = require('tree-climber')

  keymap({'n', 'v', 'o'}, 'H', tree_climber.goto_parent)
  keymap({'n', 'v', 'o'}, 'L', tree_climber.goto_child, keyopts)
  keymap({'n', 'v', 'o'}, 'J', tree_climber.goto_next, keyopts)
  keymap({'n', 'v', 'o'}, 'K', tree_climber.goto_prev, keyopts)

  keymap('n', '<c-s-k>', tree_climber.swap_prev, keyopts)
  keymap('n', '<c-s-j>', tree_climber.swap_next, keyopts)
end

return M

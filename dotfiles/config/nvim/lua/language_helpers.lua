local M = {}

function M.configure(use, keymap)
  use {
    'vim-ruby/vim-ruby',
    config = function()
      vim.g.ruby_fold = 1
    end,
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function()
      local treesitter_configs = require('nvim-treesitter.configs')
      if treesitter_configs then
        treesitter_configs.setup {
         autotag = {
            enable = true,
          }
        }
      end
    end,
  }
end

return M

local M = {}

function M.configure(use)
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true
        }
      }
    end,
  }
end

return M

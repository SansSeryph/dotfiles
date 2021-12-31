local M = {}

function M.configure(use)
  use 'numToStr/Comment.nvim'
  require('Comment').setup()

  use 'JoosepAlviste/nvim-ts-context-commentstring'
  require'nvim-treesitter.configs'.setup {
    context_commentstring = {
      enable = true
    }
  }
end

return M

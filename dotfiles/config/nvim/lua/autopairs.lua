local M = {}

function M.configure(use)
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }
end

return M

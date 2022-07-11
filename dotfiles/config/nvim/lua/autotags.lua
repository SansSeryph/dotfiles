local M = {}

function M.configure(use, _)
  use {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup({ check_ts = true })
    end
  }
end

return M

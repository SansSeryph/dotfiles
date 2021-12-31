local M = {}

function M.configure(use)
  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup({})
end

return M

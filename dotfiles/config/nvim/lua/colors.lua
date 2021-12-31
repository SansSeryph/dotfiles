local M = {}

function M.configure(use)
  use 'norcalli/nvim-colorizer.lua'
  require'colorizer'.setup()
end

return M

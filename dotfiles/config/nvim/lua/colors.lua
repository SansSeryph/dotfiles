local M = {}

function M.configure(use)
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end,
  }
end

return M

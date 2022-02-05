local M = {}

function M.configure(use, keymap)
  use 'phongnh/vim-sayonara'

  vim.g.sayonara_filetypes = {
    trouble = 'TroubleClose',
    fugitive = 'bdelete'
  }

  keymap('', '<C-x>', '<Cmd>Sayonara!<CR>', silent)
  keymap('', '<C-c>', '<Cmd>Sayonara<CR>', silent)
end

return M

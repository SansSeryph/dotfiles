local M = {}

function M.configure(use, keymap)
  use 'phongnh/vim-sayonara'

  keymap('', '<C-x>', '<Cmd>Sayonara<CR>', silent)
  keymap('', '<C-w>', '<Cmd>Sayonara!<CR>', silent)
end

return M

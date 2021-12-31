local M = {}

function M.configure(use, keymap)
  use 'phongnh/vim-sayonara'

  keymap('', '<C-x>', '<Esc>:Sayonara<cr>', silent)
  keymap('', '<C-w>', '<Esc>:Sayonara!<cr>', silent)
end

return M

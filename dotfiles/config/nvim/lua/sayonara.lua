local M = {}

function M.configure(use, keymap)
  use { 'mhinz/vim-sayonara' }

  local opts = { noremap = true, silent = true }
  keymap('', '<C-x>', '<Cmd>Sayonara!<CR>', opts)
  keymap('', '<C-c>', '<Cmd>Sayonara<CR>', opts)
end

return M

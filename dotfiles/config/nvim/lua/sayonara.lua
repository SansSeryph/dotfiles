local M = {}

function M.configure(use)
  use {
    'phongnh/vim-sayonara',
    config = function()
      vim.g.sayonara_filetypes = {
        trouble = 'TroubleClose',
        fugitive = 'bdelete'
      }

      keymap('', '<C-x>', '<Cmd>Sayonara!<CR>', silent)
      keymap('', '<C-c>', '<Cmd>Sayonara<CR>', silent)
    end,
  }
end

return M

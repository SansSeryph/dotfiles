local M = {}

function M.configure(use, keymap)
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    configure = function()
      require('trouble').setup({})
    end
  }

  local opts = { noremap = true, silent = true }

  -- x namespace: errors
  keymap('n', '<leader>xx', '<cmd>Trouble<cr>', opts)
  keymap('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', opts)
  keymap('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', opts)
  keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)
  keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', opts)
  keymap('n', '<leader>xr', '<cmd>Trouble lsp_references<cr>', opts)
end

return M

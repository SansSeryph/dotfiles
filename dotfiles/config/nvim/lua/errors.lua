local M = {}

function M.configure(use)
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
      local opts = { silent = true, noremap = true }

      -- remaps
      keymap('n', 'gR', '<Cmd>Trouble lsp_references<CR>', opts)

      -- x namespace: trouble
      keymap('n', '<leader>xx', '<Cmd>TroubleToggle<CR>', opts)
      keymap('n', '<leader>xw', '<Cmd>Trouble workspace_diagnostics<CR>', opts)
      keymap('n', '<leader>xd', '<Cmd>Trouble document_diagnostics<CR>', opts)
      keymap('n', '<leader>xl', '<Cmd>Trouble loclist<CR>', opts)
      keymap('n', '<leader>xq', '<Cmd>Trouble quickfix<CR>', opts)
    end,
  }
end

return M

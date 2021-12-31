local M = {}

function M.configure(use)
  use 'neovim/nvim-lspconfig'
  lsp = require('lspconfig')

  -- StyleLint
  lsp.stylelint_lsp.setup({
    settings = {
      stylelintplus = {
        autoFixOnSave = true,
        cssInJs = true,
      }
    }
  })
end

return M

local M = {}

function M.configure(use, keymap)
  use 'vim-ruby/vim-ruby'

  use { 'windwp/nvim-ts-autotag' }
  require'nvim-treesitter.configs'.setup {
   autotag = {
      enable = true,
      filetypes = { "html" , "xml" },
    }
  }
end

return M

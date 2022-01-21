local M = {}

function M.configure(use, keymap)
  use 'vim-ruby/vim-ruby'
  vim.g.ruby_fold = 1

  use { 'windwp/nvim-ts-autotag' }
  require'nvim-treesitter.configs'.setup {
   autotag = {
      enable = true,
      filetypes = { "html" , "xml" },
    }
  }
end

return M

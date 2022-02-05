local M = {}

function M.configure(use)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/playground', run = ':TSInstall query' },
      { 'nvim-treesitter/nvim-treesitter-refactor' },
      { 'nvim-treesitter/nvim-tree-docs' },
      { 'nvim-treesitter/completion-treesitter' },
      { 'nvim-treesitter/tree-sitter-lua' },
      { 'nvim-treesitter/tree-sitter-query' },
      { 'nvim-treesitter/tree-sitter-c' },
    },
    config = function()
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup({})

      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    end,
  }
end

return M

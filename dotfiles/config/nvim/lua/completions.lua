local M = {}

function M.configure(use)
  lsp = require('lspconfig')

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'quangnguyen30192/cmp-nvim-tags',
      'ray-x/cmp-treesitter',
      'kristijanhusak/vim-dadbod-completion',
      { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },
      { "mtoohey31/cmp-fish", ft = "fish" },
    },
  }

  vim.o.completeopt = 'menu,menuone,noselect'

  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'fish' },
      { name = 'tags' },
      { name = 'treesitter' },
      { name = 'cmp_git' },
      { name = 'vim-dadbod-completion' },
    })
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- For list of available LSPs:
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  lsp.ansiblels.setup({ capabilities = capabilities })
  lsp.bashls.setup({ capabilities = capabilities })
  lsp.cssmodules_ls.setup({ capabilities = capabilities })
  lsp.diagnosticls.setup({ capabilities = capabilities })
  lsp.dockerls.setup({ capabilities = capabilities })
  lsp.eslint.setup({ capabilities = capabilities })
  lsp.quick_lint_js.setup({ capabilities = capabilities })
  lsp.solargraph.setup({ capabilities = capabilities })
  lsp.sqlls.setup({ capabilities = capabilities })
  lsp.tsserver.setup({ capabilities = capabilities })
  lsp.typeprof.setup({ capabilities = capabilities })
  lsp.vimls.setup({ capabilities = capabilities })
  lsp.volar.setup({ capabilities = capabilities })
  lsp.yamlls.setup({ capabilities = capabilities })
  lsp.cssls.setup { capabilities = capabilities }
  lsp.html.setup { capabilities = capabilities }
  lsp.jsonls.setup { capabilities = capabilities }
  lsp.cssls.setup { capabilities = capabilities }
  lsp.html.setup { capabilities = capabilities }
  lsp.jsonls.setup { capabilities = capabilities }
  lsp.remark_ls.setup { capabilities = capabilities }

  -- StyleLint
  lsp.stylelint_lsp.setup({
    capabilities = capabilities,
    settings = {
      stylelintplus = {
        autoFixOnSave = true,
        cssInJs = true,
      }
    }
  })
end

return M

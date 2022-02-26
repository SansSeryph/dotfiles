local M = {}

function M.configure(use)
  use {
    'neovim/nvim-lspconfig',
    config = function()
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

      local servers = {
        'html',
        'diagnosticls',
        'yamlls',
        'volar',
        'sqlls',
        'ansiblels',
        'bashls',
        'quick_lint_js',
        'jsonls',
        'tsserver',
        'stylelint_lsp',
        'cssls',
        'eslint',
        'cssmodules_ls',
        'vimls',
        'dockerls',
        'typeprof',
        'solargraph',
      }

      for _, server in ipairs(servers) do
        lsp[server].setup {
          on_attach = function(client, buffnr)
            local function buf_set_keymap(...)
              vim.api.nvim_buf_set_keymap(buffnr, ...)
            end

            local function buf_set_option(...)
              vim.api.nvim_buf_set_option(buffnr, ...)
            end

            -- Enable completion triggered by <c-x><c-o>
            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

            local opts = { noremap = true, silent = true }

            -- See `:help vim.lsp.*` for docs
            buf_set_keymap('n', 'gD',    '<Cmd>lua vim.lsp.buf.declaration()<CR>',    opts)
            buf_set_keymap('n', 'gd',    '<Cmd>lua vim.lsp.buf.definition()<CR>',     opts)
            buf_set_keymap('n', 'gr',    '<Cmd>lua vim.lsp.buf.references()<CR>',     opts)
            buf_set_keymap('n', 'gi',    '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', 'K',     '<Cmd>lua vim.lsp.buf.hover()<CR>',          opts)
            buf_set_keymap('n', '[d',    '<Cmd>lua vim.diagnostic.goto_prev()<CR>',   opts)
            buf_set_keymap('n', ']d',    '<Cmd>lua vim.diagnostic.goto_next()<CR>',   opts)
            buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          end,
          flags = { debounce_text_changes = 150 }
        }
      end

      vim.diagnostic.config({
        update_in_insert = true,
        severity_sort = true,
        virtual_text = { source = 'always' },
        float = { source = 'always' },
      })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({ virtual_text = false })
      vim.api.nvim_exec(
        [[autocmd CursorHold * silent! lua vim.lsp.buf.formatting_sync()]],
        false
      )
    end,
  }
end

return M

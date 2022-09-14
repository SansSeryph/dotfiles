local M = {}

function M.configure(use, keymap)
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Keyboard shortcuts
    keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap('n', 'gr', vim.lsp.buf.references, bufopts)
    keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    -- s namespace: LSP
    -- keymap('n', '<leader>swa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- keymap('n', '<leader>swr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- keymap('n', '<leader>swl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    keymap('n', '<leader>sd', vim.lsp.buf.type_definition, bufopts)
    keymap('n', '<leader>sr', vim.lsp.buf.rename, bufopts)
    keymap('n', '<leader>sc', vim.lsp.buf.code_action, bufopts)
    keymap('n', '<leader>sf', vim.lsp.buf.formatting, bufopts)
  end

  use {
    'neovim/nvim-lspconfig',
    config = function()
      local servers = {
        'ansiblels',
        'bashls',
        'cssls',
        'cssmodules_ls',
        'diagnosticls',
        'dockerls',
        'eslint',
        'html',
        'jsonls',
        'pyright',
        'solargraph',
        'sqlls',
        'tailwindcss',
        'tsserver',
        'vimls',
        'volar',
        'yamlls',
      }

      for _, server in ipairs(servers) do
        require('lspconfig')[server].setup({ on_attach = on_attach })
      end

      require('lspconfig').sumneko_lua.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end
  }

  vim.api.nvim_create_autocmd(
    'BufWritePre',
    {
      callback = function()
        vim.lsp.buf.formatting()
      end
    }
  )

  local opts = { noremap = true, silent = true }

  keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
  keymap('n', '[d', vim.diagnostic.goto_prev, opts)
  keymap('n', ']d', vim.diagnostic.goto_next, opts)
  keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)
end

return M

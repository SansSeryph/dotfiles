local M = {}

function M.configure(use)
  use {
    'rafcamlet/tabline-framework.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  require('tabline_framework').setup({
    render = function(f)
      f.make_tabs(function(info)
        f.add(' ' .. info.index .. ' ')

        f.add(info.filename or '[-]')
        f.add(' ')
      end)

      f.add_spacer()

      -- get some info from lsp
      local errors = vim.lsp.diagnostic.get_count(0, 'Error')
      local warnings = vim.lsp.diagnostic.get_count(0, 'Warning')

      -- and display it
      f.add { '  ' .. errors, fg = "#e86671" }
      f.add { '  ' .. warnings, fg = "#e5c07b"}
      f.add ' '
    end,
  })
end

return M

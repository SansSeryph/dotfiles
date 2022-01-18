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
    end,
  })
end

return M

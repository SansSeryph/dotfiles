local M = {}

function M.configure(use)
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup({ silent_chdir = false })
      require('telescope').load_extension('projects')

      keymap('n', '<leader>tp', '<cmd>telescope projects<cr>', {})
    end,
  }
end

return M

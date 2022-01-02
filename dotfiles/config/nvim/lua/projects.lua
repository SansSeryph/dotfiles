local M = {}

function M.configure(use, keymap)
  use 'ahmedkhalf/project.nvim'
  require('project_nvim').setup({ silent_chdir = false })
  require('telescope').load_extension('projects')

  keymap('n', '<leader>tp', ':Telescope projects<cr>', {})
end

return M

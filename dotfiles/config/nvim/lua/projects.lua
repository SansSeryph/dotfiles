local M = {}

function M.configure(use, keymap)
  use 'ahmedkhalf/project.nvim'
  require('project_nvim').setup({ silent_chdir = false })
  require('telescope').load_extension('projects')

  keymap('n', '<leader>tp', '<Cmd>Telescope projects<CR>', {})
end

return M

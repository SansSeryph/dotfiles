local M = {}

function M.configure(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-node-modules.nvim' },
      { 'nvim-telescope/telescope-packer.nvim' },
    },
  }

  require('nvim-web-devicons').setup({})
  local telescope = require('telescope')

  telescope.setup({
    defaults = {
      color_devicons = true,
      layout = 'horizontal',
      layout_config = {
        anchor = 'CENTER',
        height = 0.9,
        width = 0.9,
      },
      prompt_prefix = '🔎 ',
      selection_caret = '➤ ',
      mappings = {
        i = {
          ['<C-a>'] = 'toggle_all',
          ['<ESC>'] = 'close',
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
    },
  })

  telescope.load_extension('packer')
  telescope.load_extension('fzf')
  telescope.load_extension('node_modules')

  -- remaps
  keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', {})

  -- f namespace: Telescope
  keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', noremap)
  keymap('n', '<leader>fg', "<Cmd>Telescope grep_string search=''<CR>", noremap)
  keymap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', noremap)
  keymap('n', '<leader>ft', '<Cmd>Telescope tags<CR>', noremap)
  keymap('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>', noremap)
  keymap('n', '<leader>fv', "<Cmd>Telescope find_files search_dirs=~/.config/nvim/<CR>", noremap)
end

return M

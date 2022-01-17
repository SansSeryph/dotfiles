local M = {}

function M.configure(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-packer.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'xiyaowong/telescope-emoji.nvim' },
    }
  }

  require('nvim-web-devicons').setup({})

  local telescope = require('telescope')

  telescope.setup({
    defaults = {
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
    },
  })

  telescope.load_extension('fzf')
  telescope.load_extension('emoji')
  telescope.load_extension('packer')

  -- ctrl maps
  keymap('', '<C-f>', '<Cmd>Telescope find_files<CR>', noremap)
  keymap('', '<C-g>', '<Cmd>Telescope live_grep<CR>', noremap)
  keymap('', '<C-b>', '<Cmd>Telescope buffers<CR>', noremap)

  -- remaps
  keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', {})

  -- f namespace: Telescope
  keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', noremap)
  keymap('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>', noremap)
  keymap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', noremap)
  keymap('n', '<leader>ft', '<Cmd>Telescope tags<CR>', noremap)
  keymap('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>', noremap)
  keymap('n', '<leader>fe', '<Cmd>Telescope emoji<CR>', noremap)
end

return M

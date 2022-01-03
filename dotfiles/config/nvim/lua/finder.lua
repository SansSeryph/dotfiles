local M = {}

function M.configure(use)
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'xiyaowong/telescope-emoji.nvim'
  use 'nvim-telescope/telescope-packer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
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
        n = {
          ['<C-n>'] = false,
          ['<C-p>'] = false,
        },
        i = {
          ['<C-n>'] = false,
          ['<C-p>'] = false,
          ['<C-j>'] = 'move_selection_next',
          ['<C-k>'] = 'move_selection_previous',
          ['<C-n>'] = 'move_to_bottom',
          ['<C-p>'] = 'move_to_top',
          ['<C-a>'] = 'toggle_all',
          ['<ESC>'] = 'close',
        },
      },
    },
  })

  telescope.load_extension('fzf')
  telescope.load_extension('emoji')
  telescope.load_extension('packer')

  keymap('', '<C-f>', '<Cmd>Telescope find_files<CR>', noremap)
  keymap('', '<C-g>', '<Cmd>Telescope live_grep<CR>', noremap)
  keymap('', '<C-S-G>', '<Cmd>Telescope grep_string<CR>', noremap)
  keymap('', '<C-b>', '<Cmd>Telescope buffers<CR>', noremap)

  keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', {})

  -- t namespace: Telescope
  keymap('n', '<leader>tt', '<Cmd>Telescope tags<CR>', noremap)
  keymap('n', '<leader>th', '<Cmd>Telescope help_tags<CR>', noremap)
  keymap('n', '<leader>te', '<Cmd>Telescope emoji<CR>', noremap)
end

return M

local M = {}

function M.configure(use)
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'kyazdani42/nvim-web-devicons'
  require('nvim-web-devicons').setup({})

  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

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

  keymap('', '<C-f>', '<Esc>:Telescope find_files<cr>', noremap)
  keymap('', '<C-g>', '<Esc>:Telescope live_grep<cr>', noremap)
  keymap('', '<C-S-G>', '<Esc>:Telescope grep_string<cr>', noremap)
  keymap('', '<C-b>', '<Esc>:Telescope buffers<cr>', noremap)

  keymap('n', 'gd', ':Telescope lsp_definitions<cr>', {})

  -- t namespace: Telescope
  keymap('n', '<leader>tt', ':Telescope tags<cr>', noremap)
  keymap('n', '<leader>th', ':Telescope help_tags<cr>', noremap)
end

return M

local M = {}

function M.configure(use, keymap)

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-node-modules.nvim' },
      { 'nvim-telescope/telescope-packer.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'xiyaowong/telescope-emoji.nvim' },
    },
    config = function()
      require('nvim-web-devicons').setup({})

      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          color_devicons = true,
          file_ignore_patterns = { 'node_modules' },
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
        }
      })

      telescope.load_extension('emoji')
      telescope.load_extension('fzf')
      telescope.load_extension('node_modules')
      telescope.load_extension('packer')
    end
  }

  local opts = { noremap = true, silent = true }
  local prefix = 'lua require("telescope.builtin").'

  -- f namespace: Telescope
  local leader_maps = {
    fe = 'emoji()',
    ff = 'find_files({ hidden = true, no_ignore=true, follow=true, previewer=false })',
    fg = 'grep_string({ search="" })',
    fb = 'buffers()',
    ft = 'tags()',
    fh = 'help_tags()',
    fv = 'find_files({ search_dirs={ "~/.config/nvim/" } })',
    fi = 'lsp_references()',
    fd = 'lsp_definitions()',
  }

  for map, command in pairs(leader_maps) do
    keymap(
      'n',
      '<leader>' .. map,
      '<cmd>' .. prefix .. command .. '<CR>',
      opts
    )
  end
end

return M

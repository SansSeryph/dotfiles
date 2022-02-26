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
    config = function()
      require('nvim-web-devicons').setup({})
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          color_devicons = true,
          file_ignore_patterns = { "node_modules" },
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

      telescope.load_extension('packer')
      telescope.load_extension('fzf')
      telescope.load_extension('node_modules')

      local prefix = '<Cmd>lua require("telescope.builtin").'
      local suffix = '<CR>'
      local leader = '<leader>'

      -- remaps
      keymap('n', 'gd', prefix .. 'lsp_definitions()' .. suffix, {})

      -- f namespace: Telescope
      local leader_maps = {
        ff = 'find_files({hidden = true, no_ignore=true, follow=true, previewer=false})',
        fg = 'grep_string({search=""})',
        fb = 'buffers()',
        ft = 'tags()',
        fh = 'help_tags()',
        fv = 'find_files({search_dirs={"~/.config/nvim/"}})',
        fi = 'lsp_references()',
      }

      for map, command in pairs(leader_maps) do
        keymap('n', leader .. map, prefix .. command .. suffix, {})
      end
    end,
  }

end

return M

-- ############################################################################
-- # Neovim Settings
-- ############################################################################

-- ------------------------------------
-- | Helpers
-- ------------------------------------

local keymap = vim.keymap.set

-- ------------------------------------
-- | Basic Configuration
-- ------------------------------------

require('settings')
require('keymaps').configure(keymap)

-- ############################################################################
-- # Plugins
-- ############################################################################

-- ------------------------------------
-- | Initialize Packer
-- ------------------------------------

local packer_path = '/site/pack/packer/start/packer.nvim'
local install_path = vim.fn.stdpath('data')..packer_path

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  local packer_repo_url = 'https://github.com/wbthomason/packer.nvim'
  local args = {'git', 'clone', '--depth', '1', packer_repo_url, install_path}
  PackerBootstrap = vim.fn.system(args)
end

-- ------------------------------------
-- | Load Plugins
-- ------------------------------------

local packer = require('packer')
return packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'
    use 'fladson/vim-kitty'

    use {
      'vim-ruby/vim-ruby',
      config = function()
        vim.g.ruby_fold = 1
      end
    }

    use {
      'catppuccin/nvim',
      as = 'catppuccin',
      config = function()
        require('catppuccin').setup({ term_colors = true })
        vim.cmd([[colorscheme catppuccin]])
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('gitsigns').setup({}) end
    }

    use {
      'norcalli/nvim-colorizer.lua',
      config = function() require('colorizer').setup({}) end
    }

    require('autotags').configure(use, keymap)
    require('errors').configure(use, keymap)
    require('treesitter').configure(use, keymap)
    require('sayonara').configure(use, keymap)
    require('tpope').configure(use, keymap)
    require('lsp').configure(use, keymap)
    require('finder').configure(use, keymap)
    require('statusbar').configure(use, keymap)
    require('tabs').configure(use, keymap)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PackerBootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float
    },
    profile = {
      enable = true,
      threshold = 1
    }
  }
})

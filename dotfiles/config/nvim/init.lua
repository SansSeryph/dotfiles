-- ------------------------------------
-- | Helpers
-- ------------------------------------

keymap = vim.api.nvim_set_keymap
noremap = { noremap = true }
silent = { silent = true }
noremap_silent = { noremap = true, silent = true }

-- ------------------------------------
-- | Basic Configuration
-- ------------------------------------

require('settings')
require('keymaps')

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
  local args = { 'git', 'clone', '--depth', '1', packer_repo_url, install_path }
  packer_bootstrap = vim.fn.system(args)
end

local packer = require('packer')
packer.init {}

-- ------------------------------------
-- | Start Loading Plugins
-- ------------------------------------

packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'
    use 'fladson/vim-kitty'

    -- ------------------------------------
    -- | Plugins By Name
    -- ------------------------------------

    require('treesitter').configure(use, keymap)
    require('sayonara').configure(use, keymap)

    -- ------------------------------------
    -- | Plugins By Feature
    -- ------------------------------------

    require('colorschemes').configure(use, keymap)
    require('language_servers').configure(use, keymap)
    require('completions').configure(use, keymap)
    require('finder').configure(use, keymap)
    require('statusbar').configure(use, keymap)
    require('tabs').configure(use, keymap)
    require('autopairs').configure(use, keymap)
    require('comments').configure(use, keymap)
    require('git').configure(use, keymap)
    require('colors').configure(use, keymap)
    require('errors').configure(use, keymap)
    require('language_helpers').configure(use, keymap)
    require('projects').configure(use, keymap)

    -- ------------------------------------
    -- | Plugins By TPope
    -- ------------------------------------

    require('tpope').configure(use, keymap)

    -- ------------------------------------
    -- | Sync - Keep at end
    -- ------------------------------------

    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})

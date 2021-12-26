-- ############################################################################
-- # Settings
-- ############################################################################

-- ------------------------------------
-- | Indentation
-- ------------------------------------

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- ------------------------------------
-- | Sign Column
-- ------------------------------------

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- ------------------------------------
-- | Searching
-- ------------------------------------

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tagcase = "followscs"
vim.o.incsearch = true

-- ------------------------------------
-- | Tabs
-- ------------------------------------

vim.o.showtabline = 2
-- TODO Figure out what needs to go here
-- I just want something like: <page_num> | <last_focused_file_name>
-- vim.o.tabline = ???

-- ------------------------------------
-- | Automatically save files
-- ------------------------------------

vim.g.autowrite = true
vim.o.autowriteall = true
vim.bo.swapfile = false
vim.api.nvim_exec([[autocmd CursorHold,CursorHoldI * update]], false)

-- ------------------------------------
-- | 80 char lines max
-- ------------------------------------

-- TODO Figure out how to get wrapping working correctly
-- vim.o.textwidth = 80
-- vim.o.formatoptions = "tcqjan"
-- vim.o.wrap = false

-- ------------------------------------
-- | Misc
-- ------------------------------------

vim.o.scrolloff = 100
vim.o.sidescrolloff = 8
vim.o.splitright = true
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.title = true
vim.g.shortmess = 'aoOtTIF'
vim.o.wildmode = "longest:full,full"
vim.o.updatetime = 500
vim.o.redrawtime = 10000
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = '~/.asdf/shims/python3'

-- ############################################################################
-- # Keymaps
-- ############################################################################

-- Helpers
local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }

-- Allow gf to create new files if it doesn't exits
vim.api.nvim_set_keymap('', 'gf', ':edit <cfile><cr>', {})

-- Reselect visual selection after indenting
vim.api.nvim_set_keymap('v', '<', '<gv', noremap)
vim.api.nvim_set_keymap('v', '>', '>gv', noremap)

-- Maintain cursor position when yanking visual selection
vim.api.nvim_set_keymap('v', 'y', 'myy`y', noremap)
vim.api.nvim_set_keymap('v', 'Y', 'myY`y', noremap)

-- Make Y behave like other capital letters
vim.api.nvim_set_keymap('n', 'Y', 'y$', noremap)

-- Quickly insert things ot the end of the line
vim.api.nvim_set_keymap('i', ';;', '<Esc>A;<Esc>', {})
vim.api.nvim_set_keymap('i', ',,', '<Esc>A,<Esc>', {})

-- ------------------------------------
-- | Ctrl Binds
-- ------------------------------------

-- Split navigation
vim.api.nvim_set_keymap('', '<C-h>', '<Esc><C-W>h', noremap)
vim.api.nvim_set_keymap('', '<C-j>', '<Esc><C-W>j', noremap)
vim.api.nvim_set_keymap('', '<C-k>', '<Esc><C-W>k', noremap)
vim.api.nvim_set_keymap('', '<C-l>', '<Esc><C-W>l', noremap)

-- Tab navigation
vim.api.nvim_set_keymap('', '<C-o>', '<Esc>:tabnext<cr>', noremap)
vim.api.nvim_set_keymap('', '<C-i>', '<Esc>:tabprevious<cr>', noremap)

-- Closing and quitting
vim.api.nvim_set_keymap('', '<C-x>', '<Esc>:bd<cr>', noremap_silent)
vim.api.nvim_set_keymap('', '<C-w>', '<Esc>:tabclose<cr>', noremap_silent)
vim.api.nvim_set_keymap('', '<C-q>', '<Esc>:q<cr>', noremap_silent)

-- Clear all buffers
vim.api.nvim_set_keymap('', '<C-c>', '<Esc>:bufdo! bdelete<cr>', noremap_silent)

-- Clear highlighted search text
vim.api.nvim_set_keymap('n', '<C-u>', ':nohlsearch<cr>', {})

-- ------------------------------------
-- | Leader Maps
-- ------------------------------------

-- Set <Space> as leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', noremap_silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Numbers are for tab navigation
vim.api.nvim_set_keymap('', '<leader>1', '<Esc>:tabnext 1<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>2', '<Esc>:tabnext 2<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>3', '<Esc>:tabnext 3<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>4', '<Esc>:tabnext 4<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>5', '<Esc>:tabnext 5<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>6', '<Esc>:tabnext 6<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>7', '<Esc>:tabnext 7<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>8', '<Esc>:tabnext 8<cr>', noremap)
vim.api.nvim_set_keymap('', '<leader>9', '<Esc>:tabnext 9<cr>', noremap)

-- v namespace: tools for vim itself
vim.api.nvim_set_keymap('n', '<leader>ve', ':tabedit ~/.config/nvim/init.lua<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>vs', ':source ~/.config/nvim/init.lua<cr>', noremap)

-- ############################################################################
-- # Plugins
-- ############################################################################

-- ------------------------------------
-- | Packer Init
-- ------------------------------------

local packer_path = '/site/pack/packer/start/packer.nvim'
local install_path = vim.fn.stdpath('data')..packer_path

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	local packer_repo_url = 'https://github.com/wbthomason/packer.nvim'
	local args = { 'git', 'clone', '--depth', '1', packer_repo_url, install_path }
  packer_bootstrap = vim.fn.system(args)
end

local packer = require('packer')

-- I don't like turning this off but it's annoying
-- TODO Perhaps I could modify this to use something like vim-notify?
packer.init { display = { non_interactive = true, open_cmd = '' } }

-- TODO Move each plugin sets to their own file
return packer.startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'fladson/vim-kitty'

  -- ------------------------------------
  -- | Colorschemes
  -- ------------------------------------

  use 'dracula/vim'
  vim.api.colorscheme = 'dracula'

  -- ------------------------------------
  -- | Treesitter
  -- ------------------------------------
  --
  -- Neovim does come with it but let's get the latest and the plugins
  -- TODOs
    -- Spend more time with this plugin and learn how to use it better
    -- Do some more configuring with nvim-tree-docs
    -- Figure out why the error messages in :checkhealth are appearing

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground', run = ':TSInstall query' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-tree-docs'
  use 'nvim-treesitter/completion-treesitter'

  use 'nvim-treesitter/tree-sitter-lua'
  use 'nvim-treesitter/tree-sitter-query'
  use 'nvim-treesitter/tree-sitter-c'

  require('nvim-treesitter.configs').setup({})

  vim.o.foldmethod = 'expr'
  vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

  -- ------------------------------------
  -- | Language Servers
  -- ------------------------------------
  -- TODOs
    -- See if there's a SASS language server (or if cssls can do it)
    -- Add eslint's EslintFixAll?
    -- Find a Lua LSP
    -- Look into installing zeta_note

  use 'neovim/nvim-lspconfig'
  local lsp = require('lspconfig')

  -- LSPs that require no special setup
  lsp.ansiblels.setup({})
  lsp.bashls.setup({})
  lsp.cssmodules_ls.setup({})
  lsp.diagnosticls.setup({})
  lsp.dockerls.setup({})
  lsp.eslint.setup({})
  lsp.quick_lint_js.setup({})
  lsp.solargraph.setup({})
  lsp.sqlls.setup({})
  lsp.tsserver.setup({})
  lsp.typeprof.setup({})
  lsp.vimls.setup({})
  lsp.volar.setup({})
  lsp.vls.setup({})
  lsp.yamlls.setup({})

  -- HTML / CSS / JSON
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lsp.cssls.setup { capabilities = capabilities }
  lsp.html.setup { capabilities = capabilities }
  lsp.jsonls.setup { capabilities = capabilities }

  -- StyleLint
  lsp.stylelint_lsp.setup({
    settings = {
      stylelintplus = {
        autoFixOnSave = true,
        cssInJs = true,
      }
    }
  })

  -- This should stay at the end
  if packer_bootstrap then
    packer.sync()
  end
end)

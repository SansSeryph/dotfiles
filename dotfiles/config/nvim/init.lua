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
vim.api.nvim_exec([[autocmd CursorHold,CursorHoldI * silent! update]], false)

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
vim.o.foldlevelstart = 99

-- ############################################################################
-- # Keymaps
-- ############################################################################

-- Helpers
local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }

-- Allow gf to create new files if it doesn't exits
vim.api.nvim_set_keymap('n', 'gf', ':edit <cfile><cr>', {})

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
vim.api.nvim_set_keymap('n', '<leader>1', ':tabnext 1<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>2', ':tabnext 2<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>3', ':tabnext 3<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>4', ':tabnext 4<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>5', ':tabnext 5<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>6', ':tabnext 6<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>7', ':tabnext 7<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>8', ':tabnext 8<cr>', noremap)
vim.api.nvim_set_keymap('n', '<leader>9', ':tabnext 9<cr>', noremap)

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
-- TODO Perhaps I could modify this to use something like plenary and vim-notify?
packer.init { display = { non_interactive = true, open_cmd = '' } }

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'fladson/vim-kitty'

  -- ------------------------------------
  -- | Colorschemes
  -- ------------------------------------

  use 'dracula/vim'
  use({ "catppuccin/nvim", as = "catppuccin" })

  require('catppuccin').setup({
    term_colors = true,
    integrations = {
      treesitter = true,
      telescope = true,
      markdown = true,
    },
  })

  vim.cmd[[colorscheme catppuccin]]

  -- ------------------------------------
  -- | Treesitter
  -- ------------------------------------

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground', run = ':TSInstall query' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-tree-docs'
  use 'nvim-treesitter/completion-treesitter'

  use 'nvim-treesitter/tree-sitter-lua'
  use 'nvim-treesitter/tree-sitter-query'
  use 'nvim-treesitter/tree-sitter-c'

  require("nvim-treesitter.install").prefer_git = true
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

  -- ------------------------------------
  -- | Telescope
  -- ------------------------------------

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
          ['<C-S-J>'] = 'move_to_bottom',
          ['<C-S-K>'] = 'move_to_top',
          ['<C-a>'] = 'toggle_all',
          ['<ESC>'] = 'close',
        },
      },
    },
  })

  telescope.load_extension('fzf')

  vim.api.nvim_set_keymap('', '<C-f>', '<Esc>:Telescope find_files<cr>', noremap)
  vim.api.nvim_set_keymap('', '<C-g>', '<Esc>:Telescope live_grep<cr>', noremap)
  vim.api.nvim_set_keymap('', '<C-S-G>', '<Esc>:Telescope grep_string<cr>', noremap)
  vim.api.nvim_set_keymap('', '<C-b>', '<Esc>:Telescope buffers<cr>', noremap)

  vim.api.nvim_set_keymap('n', 'gd', ':Telescope lsp_definitions<cr>', {})

  -- t namespace: Telescope
  vim.api.nvim_set_keymap('n', '<leader>tt', ':Telescope tags<cr>', noremap)
  vim.api.nvim_set_keymap('n', '<leader>th', ':Telescope help_tags<cr>', noremap)

  -- This should stay at the end
  if packer_bootstrap then
    packer.sync()
  end
end)

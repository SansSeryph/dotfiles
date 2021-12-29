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
local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }
local silent = { silent = true }

-- Allow gf to create new files if it doesn't exits
keymap('n', 'gf', ':edit <cfile><cr>', {})

-- Reselect visual selection after indenting
keymap('v', '<', '<gv', noremap)
keymap('v', '>', '>gv', noremap)

-- Maintain cursor position when yanking visual selection
keymap('v', 'y', 'myy`y', noremap)
keymap('v', 'Y', 'myY`y', noremap)

-- Make Y behave like other capital letters
keymap('n', 'Y', 'y$', noremap)

-- Quickly insert things ot the end of the line
keymap('i', ';;', '<Esc>A;<Esc>', {})
keymap('i', ',,', '<Esc>A,<Esc>', {})

-- ------------------------------------
-- | Ctrl Binds
-- ------------------------------------

-- Split navigation
keymap('', '<C-h>', '<Esc><C-W>h', noremap)
keymap('', '<C-j>', '<Esc><C-W>j', noremap)
keymap('', '<C-k>', '<Esc><C-W>k', noremap)
keymap('', '<C-l>', '<Esc><C-W>l', noremap)

-- Tab navigation
keymap('', '<C-o>', '<Esc>:tabnext<cr>', noremap)
keymap('', '<C-i>', '<Esc>:tabprevious<cr>', noremap)

-- Closing and quitting
keymap('', '<C-x>', '<Esc>:bd<cr>', noremap_silent)
keymap('', '<C-w>', '<Esc>:tabclose<cr>', noremap_silent)
keymap('', '<C-q>', '<Esc>:q<cr>', noremap_silent)

-- Clear all buffers
keymap('', '<C-c>', '<Esc>:bufdo! bdelete<cr>', noremap_silent)

-- Clear highlighted search text
keymap('n', '<C-u>', ':nohlsearch<cr>', silent)
keymap('i', '<C-u>', '<Esc>:nohlsearch<cr>i', silent)

-- ------------------------------------
-- | Leader Maps
-- ------------------------------------

-- Set <Space> as leader
keymap('', '<Space>', '<Nop>', noremap_silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Numbers are for tab navigation though these will get overwritten if
-- Bufferline is enabled
keymap('n', '<leader>1', ':tabnext 1<cr>', silent)
keymap('n', '<leader>2', ':tabnext 2<cr>', silent)
keymap('n', '<leader>3', ':tabnext 3<cr>', silent)
keymap('n', '<leader>4', ':tabnext 4<cr>', silent)
keymap('n', '<leader>5', ':tabnext 5<cr>', silent)
keymap('n', '<leader>6', ':tabnext 6<cr>', silent)
keymap('n', '<leader>7', ':tabnext 7<cr>', silent)
keymap('n', '<leader>8', ':tabnext 8<cr>', silent)
keymap('n', '<leader>9', ':tabnext 9<cr>', silent)

-- v namespace: tools for vim itself
keymap('n', '<leader>ve', ':tabedit ~/.config/nvim/init.lua<cr>', noremap)
keymap('n', '<leader>vs', ':source ~/.config/nvim/init.lua<cr>', noremap)

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
  use { 'catppuccin/nvim', as = 'catppuccin' }

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

  require('nvim-treesitter.install').prefer_git = true
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

  -- ------------------------------------
  -- | Lualine
  -- ------------------------------------

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  require('lualine').setup({
    options = {
      theme = 'catppuccin',
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
      },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
  })

  -- ------------------------------------
  -- | Tabline Framework
  -- ------------------------------------

  use {
    'rafcamlet/tabline-framework.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  require('tabline_framework').setup({
    render = function(f)
      f.make_tabs(function(info)
        f.add(' ' .. info.index .. ' ')

        f.add(info.filename or '[-]')
        f.add(' ')
      end)

      f.add_spacer()

      -- get some info from lsp
      local errors = vim.lsp.diagnostic.get_count(0, 'Error')
      local warnings = vim.lsp.diagnostic.get_count(0, 'Warning')

      -- and display it
      f.add { '  ' .. errors, fg = "#e86671" }
      f.add { '  ' .. warnings, fg = "#e5c07b"}
      f.add ' '
    end,
  })

  -- This should stay at the end
  if packer_bootstrap then
    packer.sync()
  end
end)

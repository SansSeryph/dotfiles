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
keymap('', '<C-x>', '<Esc>:bd<cr>', silent)
keymap('', '<C-w>', '<Esc>:tabclose<cr>', silent)
keymap('', '<C-q>', '<Esc>:q<cr>', silent)

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

-- Numbers are for tab navigation
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

  use 'neovim/nvim-lspconfig'
  local lsp = require('lspconfig')

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
  -- | Completions
  -- ------------------------------------

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'quangnguyen30192/cmp-nvim-tags',
      'ray-x/cmp-treesitter',
      'kristijanhusak/vim-dadbod-completion',
      { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },
      { "mtoohey31/cmp-fish", ft = "fish" },
    },
  }

  vim.o.completeopt = 'menu,menuone,noselect'

  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'fish' },
      { name = 'tags' },
      { name = 'treesitter' },
      { name = 'cmp_git' },
      { name = 'vim-dadbod-completion' },
    })
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lsp.ansiblels.setup({ capabilities = capabilities })
  lsp.bashls.setup({ capabilities = capabilities })
  lsp.cssmodules_ls.setup({ capabilities = capabilities })
  lsp.diagnosticls.setup({ capabilities = capabilities })
  lsp.dockerls.setup({ capabilities = capabilities })
  lsp.eslint.setup({ capabilities = capabilities })
  lsp.quick_lint_js.setup({ capabilities = capabilities })
  lsp.solargraph.setup({ capabilities = capabilities })
  lsp.sqlls.setup({ capabilities = capabilities })
  lsp.tsserver.setup({ capabilities = capabilities })
  lsp.typeprof.setup({ capabilities = capabilities })
  lsp.vimls.setup({ capabilities = capabilities })
  lsp.volar.setup({ capabilities = capabilities })
  lsp.yamlls.setup({ capabilities = capabilities })
  lsp.cssls.setup { capabilities = capabilities }
  lsp.html.setup { capabilities = capabilities }
  lsp.jsonls.setup { capabilities = capabilities }
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

  -- ------------------------------------
  -- | TPope
  -- ------------------------------------

  use 'tpope/vim-fugitive'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-rake'
  use 'tpope/vim-bundler'
  use 'tpope/vim-rails'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-repeat'
  use 'tpope/vim-endwise'
  use 'tpope/vim-apathy'
  use 'tpope/vim-rhubarb'

  keymap('n', '<leader>g', ':Git<cr>', silent)

  -- ------------------------------------
  -- | Autopairs
  -- ------------------------------------

  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup({})

  -- ------------------------------------
  -- | Comments
  -- ------------------------------------

  use 'numToStr/Comment.nvim'
  require('Comment').setup()

  use 'JoosepAlviste/nvim-ts-context-commentstring'
  require'nvim-treesitter.configs'.setup {
    context_commentstring = {
      enable = true
    }
  }

  -- ------------------------------------
  -- | Gitsigns
  -- ------------------------------------

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  require('gitsigns').setup()

  -- ------------------------------------
  -- | Colors
  -- ------------------------------------

  use 'norcalli/nvim-colorizer.lua'
  require'colorizer'.setup()

  -- ------------------------------------
  -- | Buffer Management
  -- ------------------------------------

  use 'phongnh/vim-sayonara'

  keymap('', '<C-x>', '<Esc>:Sayonara<cr>', silent)
  keymap('', '<C-w>', '<Esc>:Sayonara!<cr>', silent)

  -- ------------------------------------
  -- | Trouble
  -- ------------------------------------

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  require("trouble").setup({})

  -- x namespace: tools for vim itself
  keymap('', '<c-e>', ':TroubleToggle<cr>', silent)

  -- ------------------------------------
  -- | Language Helpers
  -- ------------------------------------

  use 'vim-ruby/vim-ruby'

  use { 'windwp/nvim-ts-autotag' }
  require'nvim-treesitter.configs'.setup {
   autotag = {
      enable = true,
      filetypes = { "html" , "xml" },
    }
  }

  -- This should stay at the end
  if packer_bootstrap then
    packer.sync()
  end
end)

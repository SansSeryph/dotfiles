-- ------------------------------------
-- | Helpers
-- ------------------------------------

local set = vim.o
local global = vim.g
local window = vim.w

-- ------------------------------------
-- | Indentation
-- ------------------------------------

set.expandtab = true
set.smarttab = true
set.autoindent = true
set.smartindent = true

set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

-- ------------------------------------
-- | Sign Column
-- ------------------------------------

set.number = true
set.relativenumber = true
set.signcolumn = "yes"

-- ------------------------------------
-- | Searching
-- ------------------------------------

set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.tagcase = "smart"

-- ------------------------------------
-- | Automatically save files
-- ------------------------------------

set.autowriteall = true
set.swapfile = false
vim.cmd([[autocmd CursorHold,CursorHoldI * silent! update]], false)

-- ------------------------------------
-- | Misc
-- ------------------------------------

set.splitright = true
set.hidden = true
set.termguicolors = true
set.undofile = true
set.title = true

set.scrolloff = 100
set.sidescrolloff = 8
global.shortmess = 'aoOtTIF'
set.wildmode = "longest:full,full"
set.updatetime = 500
set.redrawtime = 5000
global.python3_host_prog = '~/.asdf/shims/python3'
window.foldmethod = 'syntax'

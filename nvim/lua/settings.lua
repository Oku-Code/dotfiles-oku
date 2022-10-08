------------------
-- Basic config --
------------------

-- Global variables
local set = vim.o
local let = vim.g

-- Set Encoding
set.encoding = 'UTF-8'

-- Better UI Tweaks
set.termguicolors = true
set.relativenumber = true
set.number = true
set.numberwidth = 5
set.cursorline = true
set.signcolumn = 'yes:1'

-- Better Editing 
set.expandtab = true
set.cindent = true
set.shiftwidth = true
set.textwidth = 300
set.ruler = true
set.smartindent = true
set.autoindent = true
set.smartcase = true
set.wrap = true
set.tabstop = 4
set.softtabstop = -1

-- Settings LeaderKey
let.mapleader = ' '

-- Clipboard Integration
set.clipboard = 'unnamedplus'

-- Backup and Undo Options
set.swapfile = false
set.writebackup = false
set.backup = false
set.undofile = true

-- Split Buffers
set.splitright = true
set.splitbelow = true

-- Mouse Support
set.mouse = 'a'

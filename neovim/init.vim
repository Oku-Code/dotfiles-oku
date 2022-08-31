set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"Basic Config
syntax enable 
let mapleader=" "
set nowrap
set cursorline
set mouse=a
set encoding=UTF-8
set ruler
set smartindent
set smartcase
set incsearch
set nu
set autoindent
set expandtab
set softtabstop=4
set tabstop=4 shiftwidth=4
set noswapfile
set nobackup
set relativenumber 
set clipboard+=unnamedplus

"Call Plugins, Keybindings and Plugin Configuration
so ~/.vim/plugins.vim
so ~/.vim/plugin-config.vim
so ~/.vim/maps.vim

"Color Scheme and Lightline Theme
set laststatus=2     
set termguicolors

colorscheme tokionight

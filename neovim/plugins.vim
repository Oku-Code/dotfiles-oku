"Plugin
call plug#begin('~/.vim/plugged')

"Python Support
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vista.vim'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} 
Plug 'sbdchd/neoformat'

"File search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"JS support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Function autocompletion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"Read documents and code
Plug 'junegunn/goyo.vim'

"Color Scheme
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'
Plug 'tanvirtin/monokai.nvim'

"NerdTree"
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

"Autocomplete python and js
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


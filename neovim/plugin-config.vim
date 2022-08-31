"General config for the plugins
"Deoplete
let g:deoplete#enable_at_startup = 1

"FZF Search
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:neoformat_basic_format_align = 1
"Enable tab to space conversion
let g:neoformat_basic_format_retab = 1
"Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


"Nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
let g:javascript_plugin_flow = 1

"FZF file search
let g:fzf_action = {
  \'ctrl-t' : 'tab-split',
  \'ctrl-s' : 'split',
  \'ctrl-v' : 'vsplit',
  \}

"For themes
let g:ayucolor = "light"
let g:ayucolor = "dark"
let g:ayucolor = "mirage"
"let g:tokyonight_style = "storm"
let g:tokyonight_style = "dark"
"let g:tokyonight_style = "day"
let g:tokyonight_italic_functions = 0
let g:tokyonight_sidebars = ["qf", "vista_kind", "terminal", "packer"]

colorscheme tokyonight

"Lightline Theme"    
let g:lightline = {
       \ 'colorscheme': 'tokyonight',
       \ }

""Some language support
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pyright']

"Split Navigation good for me
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"NerdTree Open"
map <C-n> :NERDTreeToggle<CR>

"No Arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Down> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Down> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Down> <Nop>

"Simple bindings
map <C-o> :w<CR>
map <C-x> :q<CR>
map <C-d> :q!<CR>
map <C-z> :source %<CR>

"FZF search
nnoremap <C-f> :FZF<CR>

"Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

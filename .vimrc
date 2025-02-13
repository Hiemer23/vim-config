syntax on
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/tagbar'
  Plug 'nathanaelkane/vim-indent-guides' 
  Plug 'vim-airline/vim-airline'
  Plug 'ap/vim-buftabline'
call plug#end()
" Show line numbers
set number relativenumber

" Show file stats
set ruler

" Autocomplete
inoremap <C-\> <C-x><C-v>

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
set mouse=a

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
set path+=**
set wildmenu

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>


" NerdTree Settings:
map <C-b> :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree| wincmd p

set background=dark
colorscheme gruvbox

" Shortcut Plugins
nmap <F7> :TagbarToggle<CR>

" Ativa automaticamente as guias de indentação ao iniciar o Vim
autocmd VimEnter * IndentGuidesEnable
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

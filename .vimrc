syntax on
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox'
  Plug 'nathanaelkane/vim-indent-guides' 
  Plug 'vim-airline/vim-airline'
  Plug 'ap/vim-buftabline'
  Plug 'neoclide/coc.nvim'
  Plug 'jiangmiao/auto-pairs'

call plug#end()

" Tecla principal
let mapleader = " "

" Show line numbers
set number relativenumber

" Show file stats
set ruler
set splitbelow

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
set mousemodel=popup

" copy and paste
vmap <leader>y :!xclip -f -sel clip<CR>
map <leader>p :-1r !xclip -o -sel clip<CR>

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

" Ativa automaticamente as guias de indentação ao iniciar o Vim
autocmd VimEnter * IndentGuidesEnable
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)


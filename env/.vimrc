set clipboard=unnamedplus

" Show a few lines of context around the cursor
set scrolloff=10

" Enable incremental search
set incsearch

" Set tab width
set tabstop=4

" Prevent use of Ex mode and map Q to formatting
map Q gq

" Enable line numbers
set number
set relativenumber

" Yanking and pasting from system clipboard
map <C-v> "+p
map <C-c> "+y
imap <C-v> <C-r>+
imap <C-S-v> <Esc>"+pi

" Scroll while keeping the cursor centered
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz

" Keep search terms centered
nmap n nzzzv
nmap N Nzzzv

" Move visual selection up/down
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" Leader key
let mapleader = " "

set nohlsearch
set number relativenumber
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on
syntax on

" Yank selected text to system clipboard
noremap <C-c> "+y

" Paste from system clipboard
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+
cnoremap <C-v> <C-r>+

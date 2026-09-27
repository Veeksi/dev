" =========================
" Plugins mappings
" =========================
"
" Plugins (use ":PlugInstall", ":PlugStatus" commands)
call plug#begin('~/.vim/plugged')
Plug 'ojroques/vim-oscyank'
Plug 'tpope/vim-commentary'
call plug#end()

let mapleader=" "

syntax on
set ttymouse=sgr
set mouse=a
set scrolloff=15
set incsearch
set ignorecase
set smartcase
set tabstop=4
set number
set relativenumber
set timeout
set timeoutlen=300
set hlsearch
set shiftwidth=4
set softtabstop=4
set expandtab

" =========================
" General mappings
" =========================

" Select all
nnoremap <leader>a ggVG

" Undo / Redo (match your U redo habit)
nnoremap U <C-r>

" Keep your Q = format (you had map Q gq)
nnoremap Q gq

" Close / quit (closest equivalent to “close tab”)
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>

" =========================
" Yanking & pasting (like ideavim)
" =========================
nmap <leader>y <Plug>OSCYankOperator
nmap <leader>yy <leader>y_
vmap <leader>y <Plug>OSCYankVisual

" Paste over selection without overwriting default register
vnoremap <leader>p "_dP

" Delete without overwriting clipboard/register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" =========================
" Cursor & search movement
" =========================
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Indenting keep selection
vnoremap < <gv
vnoremap > >gv

" Move visual selection up/down (same as yours)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Commenting
nmap <leader>7 gcc
vmap <leader>7 gc

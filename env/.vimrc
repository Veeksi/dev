set clipboard=unnamedplus
let mapleader=" "

set scrolloff=15
set incsearch
set ignorecase
set smartcase
set tabstop=4
set number
set relativenumber
set timeout
set timeoutlen=300

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
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Paste from system clipboard
nnoremap <C-v> "+p
inoremap <C-S-v> <C-r>+
vnoremap <C-S-v> "+p

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


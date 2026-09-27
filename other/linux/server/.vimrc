" =========================
" Plugins  (:PlugInstall, :PlugStatus, :PlugClean)
" =========================
call plug#begin('~/.vim/plugged')
Plug 'ojroques/vim-oscyank'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

let mapleader = " "

" =========================
" Appearance
" =========================
" True color (the t_8f/t_8b lines make it work inside tmux)
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Cursor shape: block in normal, bar in insert, underline in replace
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" Start with a block, and restore a bar when leaving Vim
let &t_ti .= "\e[2 q"
let &t_te .= "\e[6 q"

" silent! avoids an error on first launch, before :PlugInstall
silent! colorscheme onedark

" lightline status bar (noshowmode hides the duplicate -- INSERT --)
let g:lightline = { 'colorscheme': 'onedark' }
set laststatus=2 noshowmode

set number relativenumber cursorline
" Fixed gutter for gitgutter signs, updated quickly
set signcolumn=yes updatetime=100

" =========================
" Editing
" =========================
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set scrolloff=15
set incsearch hlsearch ignorecase smartcase
set timeout timeoutlen=300
set ttimeout ttimeoutlen=10
set mouse=a ttymouse=sgr

" =========================
" General mappings
" =========================
" Select all / redo / format
nnoremap <leader>a ggVG
nnoremap U <C-r>
nnoremap Q gq

" Quit window / quit all
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>

" =========================
" Yank / paste / delete
" =========================
" Copy to local clipboard over SSH (OSC 52)
nmap     <leader>y  <Plug>OSCYankOperator
nmap     <leader>yy <leader>y_
vmap     <leader>y  <Plug>OSCYankVisual

" Paste over / delete without overwriting the last yank
vnoremap <leader>p  "_dP
nnoremap <leader>d  "_d
vnoremap <leader>d  "_d

" =========================
" Movement
" =========================
" Keep cursor centered when scrolling and searching
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" =========================
" Visual mode
" =========================
" Indent without losing selection, move selection up/down
vnoremap < <gv
vnoremap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" =========================
" Commenting (vim-commentary)
" =========================
nmap <leader>7 gcc
vmap <leader>7 gc


set nocompatible

" Vundle (plugin manager)
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim -c PluginInstall

" init vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" start plugin includes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
" end plugin includes
call vundle#end()            " required

" airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline_theme='simple'
set laststatus=2

" nerdtree settings
let g:NerdTreeQuitOnOpen=0
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^node_modules']
nnoremap <leader>nt :NERDTreeToggle<cr>

" Example vimrc file built for PEP8 style guidlines
" USE: copy this file to the following location: ~/.vimrc 

" shiftwidth affects how >>, << and == work
set shiftwidth=4

" expandtab affects what happens when you hit <TAB>
" If set, <TAB> will insert 'softtabstop' spaces
set expandtab

" tabstop changes the width of the <TAB> character
set tabstop=4

" softtabstop specifies number of spaces <TAB> will insert
set softtabstop=4

" set expandtab! to set tabs back to normal tabs
" 
" This is all very confusing
" Example:
"   if tabstop=8, and softtabstop=4
"   and expandtab is turned off
"   then <TAB> will insert 4 spaces (because of softtabstop)
"   However, if you <TAB> twice, then you get ONE tab character
"   (because with expandtab off, the number of spaces inserted is
"   minimized by using <TAB> characters, and tabstop says one 
"   <TAB> is 8 spaces)

" If you want to turn all tab characters into spaces based on
" these tab and indentation settings, use :retab

" Make sure syntax is on
"syntax enable

" Prevent .swp files being created and ~backup files
set noswapfile
set nobackup

set t_Co=256

" Set colorscheme
colorscheme jared
" some other appealing colorschemes:
"   blue
"   desert
"   murphy
"   slate

" show line numbers
set number

" load filetype specific indent files - Loads python spacing by default
" from ~/.vim/indent/python.vim
filetype indent on
filetype plugin on

" This make the vim command line act more like bash
" when you hit the tab key to autocomplete. It will show you all the options
set wildmenu

" just nice performance boost for macros
" set lazyredraw 

" shows matching parenthesis/brackets
set showmatch  

" Set highlighting when you search using /
set hlsearch

" Set highlight matches as you type them
set incsearch 

" turn off search highlight with <leader><space>
nnoremap <leader><space> :nohlsearch<CR>

" ignore case when searching
set ignorecase

" insert date using F3
nmap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>
" Check out this site for more options:
" https://dougblack.io/words/a-good-vimrc.html


" http://learnvimscriptthehardway.stevelosh.com/
" The trick to relearning a mapping is to force
" yourself to use it by disabling the old key(s)
" inoremap <esc> <nop>
inoremap jk <esc>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Switch back and forth between HTML and PHP
nnoremap <C-H> :set filetype=html<CR>
nnoremap <C-P> :set filetype=php<CR>

" Horizontal cursor line
" set cursorline

" Vertical cursor line
set colorcolumn=80
highlight ColorColumn ctermbg=4



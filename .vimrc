" Example vimrc file built for PEP8 style guidlines
" USE: copy this file to the following location: ~/.vimrc 

" Set shift amount to four and turn tabs into spaces
set shiftwidth=4  
set expandtab
set softtabstop=4   " number of spaces in tab when editing
" set expandtab! to set tabs back to normal tabs (because of damn Makefiles)

" Make sure syntax is on
syntax enable

" Prevent .swp files being created and ~backup files
set noswapfile
set nobackup


" Set colorscheme
colorscheme ron
" some other colorschemes I might like:
"   blue
"   desert
"   murphy
"   slate
"   ...or make my own??

" show line numbers
set number

" load filetype specific indent files - Loads python spacing by default
" from ~/.vim/indent/python.vim
filetype indent on
filetype plugin on

" This is sweet, it will make the vim command line act more like bash
" when you hit the tab key to autocomplete. It will show you all the options! whaat
set wildmenu

" just nice performance boost for macros
set lazyredraw 

" shows matching parenthesis and stuff 
set showmatch  

" Set highlighting when you search for stuff using /
set hlsearch

" Set highlight matches as you type them
set incsearch 

" turn off search highlight with SPACE!!! very cool
nnoremap <leader><space> :nohlsearch<CR>

" insert date using F3
nmap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>
" There are many many many more options - I grabbed all the above from the following:
" https://dougblack.io/words/a-good-vimrc.html


" http://learnvimscriptthehardway.stevelosh.com/
" The trick to relearning a mapping is to force yourself to use it by disabling the old key(s)
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

set ignorecase

" For bells on openSUSE
" set vb t_vb=

" Kyle Gwinnup
" set cursorline
" set colorcolumn=110
" set nocompatible
" set shortmess=at

" Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim -c PluginInstall
" init vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" start plugin includes

Plugin 'vim-airline/vim-airline'
" end plugin includes
call vundle#end()            " required

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
set laststatus=2

"""""""""""""""""""
" Vundle Settings "
"""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Start of the plugins list
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'

" Stop of the plugins list
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""
" VIM Settings "
""""""""""""""""

" Define character encoding
set encoding=utf-8

" Display line number
set number

" Display relative line number
set rnu

" Change the color of the numbers
:highlight LineNr ctermfg=blue

" Show a visual line under the cursor's current line
set cursorline

" Not underline the curor's current line
:hi CursorLine   cterm=NONE

" Allow line change with arrows (<&> for normal mode, [&] for insert mode)
set whichwrap+=<,>,[,]

" Clipboard out of vim (require vim-gtk installed)
set clipboard=unnamedplus

" Open split panes to right and bottom
set splitbelow
set splitright

" Allow manual folding
set foldmethod=manual

" Highlight search results
set hlsearch

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins (~/.vim/after/ftplugin/html.vim and use setlocal)
filetype plugin on
filetype indent on

" Enable mouse
set mouse=a

""""""""""""""""""""
" Airline Settings "
""""""""""""""""""""

" Add a topline to display all buffers
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""
" NERDTree Settings "
"""""""""""""""""""""

" Start NERDTree
autocmd VimEnter * NERDTree 
" Jump to the main window
autocmd VimEnter * wincmd p
" Allow deletion in NERDTree
set modifiable


""""""""""""""""""""""
" Syntastic Settings "
""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Example of other settings
"let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_flake8_args = '--ignore="E501"'


""""""""""""""""""
" TAB MANAGEMENT "
"""""""""""""""""" 

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


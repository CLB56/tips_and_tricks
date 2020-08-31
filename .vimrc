set nocompatible             " be iMproved, required
filetype off                  " required

set encoding=utf-8

set number

"Start NERDTree
autocmd VimEnter * NERDTree
"Jump to the main window
autocmd VimEnter * wincmd p
"Allow deletion ith NerdTree
set modifiable

"Make the left and right arrow keys change line
"The < and > options turn on the desired setting for normal mode and [ and ] turn on the desired setting for insert mode.
set whichwrap+=<,>,[,]


" cipboard out of vim
set clipboard=unnamedplus


" Issue with the double quotes for json files (
" at the beginning i wanted to apply that only to json file
" but it seems it's ok
set conceallevel=0


" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" New Settings for Syntastic to get json file checking
"let g:syntastic_python_checkers=['flake8'] " I didn't need to précise to use flake8, i only installed this python checker. Line not needed for me.
"let g:syntastic_python_flake8_args = '--ignore="E501"' " GOOD! ignore long lines
"let g:syntastic_json_checkers=['jsonlint'] " i think it's useless
"au BufRead,BufNewFile *.json set filetype=json " i think it's useless



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'plasticboy/vim-markdown'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'

Plugin 'scrooloose/syntastic'

Plugin 'altercation/vim-colors-solarized'

Plugin 'Yggdroot/indentLine'

Plugin 'valloric/youcompleteme'

Plugin 'gotcha/ipdb'

Plugin 'ivanov/vim-ipython'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"For the plugin solarized colorschemes
syntax enable
set background=dark
colorscheme solarized

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

"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()

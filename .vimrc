

" Launch NERDTree at startup
autocmd VimEnter * NERDTree

" Put the cursor in the right panel (not in NERDTree)
autocmd VimEnter * wincmd p

" Enable folding of Class and Methods for Python
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar (instead of za in command line)
nnoremap <space> za

" Indent as per PEP8 for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


" Indent correctly for web files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


set encoding=utf-8

set nu


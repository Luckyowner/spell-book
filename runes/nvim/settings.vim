" indent using spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" splitbelow and right
set splitbelow splitright
" Set the default shell
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
set foldmethod=indent
set nofoldenable

syntax on
filetype plugin indent on
" Relative line numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Number of lines between cursor and scroll
set scrolloff=4

set hidden

""" AUTOCOMMANDS
autocmd! BufLeave,BufHidden ~/.config/nvim/init.vim :so ~/.config/nvim/init.vim
" clear trailling whitespace
autocmd! BufWritePre * %s/\s\+$//e
autocmd! BufNewFile,BufRead *.spell set syntax=sh

autocmd BufEnter *.sh    inoremap ,bb #!/bin/bash<Esc>o
autocmd BufEnter *.spell inoremap ,bb #!/bin/bash<Esc>o

autocmd! BufEnter *.js set shiftwidth=2
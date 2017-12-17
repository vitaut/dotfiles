" Show (partial) command in the status bar.
set showcmd

" Wrap at line boundaries.
set whichwrap+=<,>,h,l,[,]

" Highlight search results.
set hlsearch

" Display the status bar (ruler).
set ruler

" Limit text width.
set textwidth=80

" Show a vertical line after textwidth.
set colorcolumn=+1

" Show autocomplete list.
set wildmenu
set wildmode=longest:list,full

" Increase command history size.
set history=200

" Enable syntax highlighting.
syntax on

" Add fuzzy finder to runtime path.
set rtp+=~/.fzf

" Use a POSIX-comliant shell (required by Vundle).
set shell=bash

" Expand '%%' to the active file directory.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ---------------------------------------------------------------------------- "
" Install Vundle plug-in manager.
if !filereadable(expand("~/.vim/bundle/Vundle.vim/README.md"))
  !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
endif

" Required by Vundle.
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

" All of plugins must be added before the following line.
call vundle#end()
filetype plugin indent on
" ---------------------------------------------------------------------------- "

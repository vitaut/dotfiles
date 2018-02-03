" Show (partial) command in the status bar.
set showcmd

" Wrap at line boundaries.
set whichwrap+=<,>,h,l,[,]

" Highlight search results.
set hlsearch

" Enable incremental search.
set incsearch

" Remove search highlight on Ctrl-l.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Remap * to search for the selected text instead of the current word.
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>

" Remap # to search for the selected text backwards.
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" Use & to run the last substitute command with flags.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Display the status bar (ruler).
set ruler

" Limit text width.
set textwidth=80

" Use two-space indentation.
set tabstop=2
set shiftwidth=2
set expandtab

" Show a vertical line after textwidth.
set colorcolumn=+1

" Show autocomplete list.
set wildmenu
set wildmode=longest:list,full

" Increase command history size.
set history=200

" Enable syntax highlighting.
syntax on

" Run make in the build directory by default.
let &makeprg='(cd build && make)'

" Open quickfix window on make.
autocmd QuickFixCmdPost [^l]* vert cwindow 90

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

Plugin 'tpope/vim-projectionist'

" All of plugins must be added before the following line.
call vundle#end()
filetype plugin indent on
" ---------------------------------------------------------------------------- "

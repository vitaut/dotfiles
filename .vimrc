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
set wildmode=longest,list

" Increase command history size.
set history=200

" Enable syntax highlighting.
syntax on

" Add fuzzy finder to runtime path.
set rtp+=~/.fzf

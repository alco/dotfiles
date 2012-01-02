" Turn off vi compatibility (must be the first line in .vimrc)
set nocompatible

" Highlight the columns exceeding the width of 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Set default font for the MacVim
set guifont=Menlo:h16

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Simplify tab navigation
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
" Map ; to : to simplify command input
nnoremap ; :

" Basic functionality
syntax enable
set encoding=utf-8
set showcmd
set ruler                       " show the line and column numbers
set showmode
set scrolloff=3                 " minimum number of lines displayed around the cursor
set autoindent
set backspace=indent,eol,start
set hidden                      " don't ask to save a buffer before hiding it
"set laststatus=2                " always show the status line
" new in vim 7.3
"set relativenumber
"set undofile
filetype plugin indent on

"set list
set listchars=tab:▸\ ,eol:¬

" It is said that modelines bit has some security problems
set modelines=0

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nowrap

set hlsearch
" Turn off highlighted search words when <C-N> is pressed
nmap <silent> <C-N> :silent noh<CR>
set incsearch
set ignorecase
set smartcase

" Toggle the highlight color of the current line
" with a § key
set cursorline
highlight CursorLine cterm=NONE ctermbg=black
nnoremap <silent> § :call ToggleCursorLineColor()<CR>
function! ToggleCursorLineColor()
  let w:bright_line = exists('w:bright_line') ? !w:bright_line : 1
  if w:bright_line
    hi CursorLine ctermbg=white ctermfg=black
  else
    hi CursorLine ctermbg=black ctermfg=NONE
  endif
endfunction

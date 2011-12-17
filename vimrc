highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

set hlsearch
" Turn off highlighted search words when <C-N> is pressed
nmap <silent> <C-N> :silent noh<CR>
set incsearch
set ignorecase
set smartcase

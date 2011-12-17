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

" Toggle the highlight color of the current line
:set cursorline
:hi CursorLine cterm=NONE ctermbg=black

nnoremap <silent> ; :call ToggleCursorLineColor()<CR>
function! ToggleCursorLineColor()
  let w:bright_line = exists('w:bright_line') ? !w:bright_line : 1
  if w:bright_line
    hi CursorLine ctermbg=white ctermfg=black
  else
    hi CursorLine ctermbg=black ctermfg=NONE
  endif
endfunction

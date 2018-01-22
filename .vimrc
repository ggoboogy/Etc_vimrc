syntax on
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set viminfo='20,<1000

filetype plugin indent on
set hlsearch
set number
set textwidth=80
set ts=2
set shiftwidth=2
set expandtab

autocmd FileType python setlocal softtabstop=2
autocmd FileType python setlocal shiftwidth=2
autocmd FileType python setlocal textwidth=80

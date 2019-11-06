syntax on
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set viminfo='20,<1000

call plug#begin()
Plug 'dense-analysis/ale'
call plug#end()

let g:ale_linters = {
      \'python': ['flake8', 'mypy']
      \}

filetype plugin indent on
set encoding=utf8
set incsearch     " incremental search
set hlsearch      " highlight search items
set number        " use line no
set textwidth=80  " character limit in one line
set shiftwidth=2  " shift space width
set ts=2          " tab space width
set expandtab     " convert tab to space

" force to format to be in a unix style
set ff=unix
set ffs=unix,dos

" python mode
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal textwidth=80

" javascript mode
autocmd FileType javascript setlocal softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType javascript setlocal textwidth=0

" html mode
autocmd FileType html setlocal softtabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType html setlocal textwidth=0

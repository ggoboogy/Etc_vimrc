" plugin setup
call plug#begin()
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'       " fuzzy file finder for vim
Plug 'mileszs/ack.vim'        " search keyword across multiple files
Plug 'majutsushi/tagbar'      " browse the tags of file
Plug 'dense-analysis/ale'     " asynchronous lint engine
Plug 'itchyny/lightline.vim'  " make statusline useful
Plug 'itchyny/vim-gitbranch'  " show current git branch on statusline
Plug 'airblade/vim-gitgutter' " show git diff on the fly
call plug#end()

" ALE custom setup
let g:ale_linters = {
      \ 'python': ['flake8', 'mypy'],
      \ }

" lightline custom setup
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'],
      \              [ 'fileformat', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" gitgutter custom setup
set updatetime=250
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=None guibg=None
highlight GitGutterAdd ctermfg=34 guifg=34 ctermbg=34 guibg=34
highlight GitGutterChange ctermfg=124 guifg=124 ctermbg=124 guibg=124
highlight GitGutterDelete ctermfg=124 guifg=124 ctermbg=124 guibg=124

" map shortcut or alias into command
nnoremap <C-h> <C-w><left>
nnoremap <C-j> <C-w><down>
nnoremap <C-k> <C-w><up>
nnoremap <C-l> <C-w><right>
nnoremap <S-l> gt
nnoremap <S-h> gT
nnoremap <C-t> :TagbarToggle<CR>
nnoremap ff :FZF<CR>
nmap <C-g> <Plug>(GitGutterPreviewHunk)

" basic setup
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

syntax on
filetype plugin indent on
set bg=dark
set viminfo='20,<1000
set encoding=utf8
set incsearch     " incremental search
set hlsearch      " highlight search items
set number        " use line no
set ruler         " use cursor position
set textwidth=80  " character limit in one line
set shiftwidth=2  " shift space width
set ts=2          " tab space width
set expandtab     " convert tab to space
set laststatus=2  " show status line always
set noshowmode    " do not show current mode in statusline

" force to format to be in a unix style
set ff=unix
set ffs=unix,dos

" python mode
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal shiftwidth=4

" golang mode
autocmd FileType go setlocal noexpandtab

" java mode
autocmd FileType java setlocal softtabstop=2
autocmd FileType java setlocal shiftwidth=2
autocmd FileType java setlocal textwidth=100

" javascript mode
autocmd FileType javascript setlocal softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType javascript setlocal textwidth=0

" html mode
autocmd FileType html setlocal softtabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType html setlocal textwidth=0

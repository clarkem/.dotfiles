set encoding=utf-8
set noerrorbells " quiet please
set fileformat=unix
set relativenumber
set autoindent
set ruler
set showmatch
set mouse="a" " a == nvica modes
set pastetoggle=<F2>
set wildmenu
set laststatus=2
set wrap
set textwidth=79
set noswapfile
set nobackup
set nowritebackup
set autoread
" tabs
set et
set tabstop=4
set shiftwidth=4
set expandtab
" searching
set ignorecase
set incsearch
set hlsearch
set smartcase
" splits
set splitright
set splitbelow
" folding
set foldmethod=indent	" fold based on indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
" colours
syntax on
colorscheme cobalt2
if (has("termguicolors"))
  set termguicolors
endif
" perf?
set lazyredraw
set ttyfast
set re=0 " let vim choose re engine base on cost
set smc=250
syntax sync minlines=256

nnoremap <Leader>l :ALELint<CR>
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'  " default 'always'
let g:ale_lint_on_save = 1                " default 1
let g:ale_lint_on_enter = 0               " default 1
let g:ale_lint_on_filetype_changed = 1    " default 1
let g:ale_linters = {
            \	'javascript': ['eslint'],
            \      'python': ['flake8'],
            \ 	'*.yml': ['ansible-lint'],
            \	'*.tf': ['tflint'],
            \ }
" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Terminal mode : remap Esc change to normal
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v> <Esc><Esc>
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
end

" Move between windows with meta
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
if has('nvim')
    tnoremap <M-h> <C-\><C-n><C-w>h
    tnoremap <M-j> <C-\><C-n><C-w>j
    tnoremap <M-k> <C-\><C-n><C-w>k
    tnoremap <M-l> <C-\><C-n><C-w>l
end

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" default | jsformatter | unique tail | unique_tail_improved
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'lucius'
" HCL
let g:terraform_fmt_on_save = 1
" ##### remove trailing whitespace #######
" ###### NERDtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
"
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <silent> <leader>w :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" reindent file
map <F7> mzgg=G`
map <leader>g mzgg=G`

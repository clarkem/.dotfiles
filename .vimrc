execute pathogen#infect()
filetype plugin indent on
" ##### Pathogen Plugins ######
" Dockerfile.vim
" ack.vim
" delimitMate
" docker-compose.vim
" fzf.vim
" nerdtree
" syntastic
" vim-airline
" vim-airline-themes
" vim-autopep8
" vim-easymotion
" vim-fugitive
" vim-gitgutter
" vim-hashicorp-tools
" vim-indent-guides
" base16-vim
" ##############################
" ### Syntx highlighting & Colours ####
syntax on
set t_Co=256color
set termguicolors
set background=dark
let g:seoul256_background=235
let g:seoul256_light_background=252
colorscheme cobalt2
"####
set nocompatible    " make sure the M in Vim works :)
set number          " line numbers
set relativenumber
set ruler           " enable ruler (line#,col#,virtual col#,relative pos%)
set laststatus=2    " always show status line
set history=100     " remember what you did for longer
set incsearch       " move cursor to match while typing
set hlsearch        " highlight search term
set ignorecase      " ignore case in searches
set smartcase       " switch to case insenstive based on pattern
set nowrap          " don't make lines wrap around display
set showcmd         " see what you're typing
set noshowmode
set cursorline      " highlight current line"
"" ##### Nope #####
set nobackup        " don't generate backup files
set writebackup     " make backup files before overwrite
set noswapfile      " don't generate swp files
" set noshowmode    " lightline shows mode
set foldmethod=manual   " don't do automatic folding
set virtualedit=onemore "cursor off end of line
set scrolloff=3     " 3 lines at the end
"set list           " show hidden chars
set encoding=utf-8  " multibyte
" ##### Tab (not the cola) #####
set expandtab       " leave this at default to use hard tabs
set shiftwidth=4
set softtabstop=4
set smarttab
" use retab to convert existing tabs
" ##### Disable F1 help ####################
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>
" ##### Switch between tabs ################
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
" ##### NertTree ###################
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
" ##### Airline ####################
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='cobalt2'
let g:airline_solarized_bg='dark'
set showtabline=2
" ########## vim-indent-guides ##############
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
let g:indent_guides_guide_size = 1
" ############# delimitMate  #############
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1 " {|} => { | }
" ############# vim-easymotion ###########
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0
" ############# syntastic ################
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['ansible']
" replace the default Python checker with flake8 and pylint "
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_enable_perl_checker = 1
" ############# hcl ################
let g:terraform_fmt_on_save = 1
" ############# fzf ################
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
" ############# md #################
set rtp+=/usr/local/opt/fzf  " enable fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" ##### remove trailing whitespace #######
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" reindent file
" " reindent file
map <F7> mzgg=G`
" Show all tabs:
"/\t
" Show trailing whitespace:
" /\s\+$
" Show trailing whitespace only after some text (ignores blank lines):
"/\S\zs\s\+$
" Show spaces before a tab:
"/ \+\ze\t

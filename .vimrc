" encoding
set encoding=utf-8
" fix paths
call pathogen#infect()
call pathogen#helptags()

syntax on
colorscheme murphy
let &t_Co=256

set number
set smartindent
set showmatch
set mouse=""
set ruler
set bs=2
set laststatus=2

" tabs vs spaces
set tabstop=4
set shiftwidth=4
set expandtab

set pastetoggle=<F2>
set wildmenu

" searching preferences 
set ignorecase
set smartcase
set incsearch
set hlsearch

let mapleader=','
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

filetype plugin indent on
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
" show list of buffers 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" show only filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

filetype plugin on 

"Because I keep typing :W
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'w')?('W'):('w'))


"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        
set foldlevel=1         

"====[ Make the 81st column stand out ]====================

" EITHER the entire 81st column, full-screen...
highlight ColorColumn ctermbg=magenta
set colorcolumn=81

" OR ELSE just the 81st column of wide lines...
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

" OR ELSE on April Fools day...
" highlight ColorColumn ctermbg=red ctermfg=blue
" exec 'set colorcolumn=' . join(range(2,80,3), ',')

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" OR ELSE briefly hide everything except the match...
function! HLNext (blinktime)
    highlight BlackOnBlack ctermfg=black ctermbg=black
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let hide_pat = '\%<'.lnum.'l.'
            \ . '\|'
            \ . '\%'.lnum.'l\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
            \ . '\|'
            \ . '\%>'.lnum.'l.'
    let ring = matchadd('BlackOnBlack', hide_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" OR ELSE just highlight the match in red...
"function! HLNext (blinktime)
"    let [bufnum, lnum, col, off] = getpos('.')
"    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"    let target_pat = '\c\%#\%('.@/.'\)'
"    let ring = matchadd('WhiteOnRed', target_pat, 101)
"    redraw
"    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"    call matchdelete(ring)
"    redraw
"    endfunction

"===[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list


"====[ Swap : and ; to make colon commands easier to type ]======

    nnoremap  ;  :
    nnoremap  :  ;


"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======
"
"    nnoremap    v   <C-V>
"    nnoremap <C-V>     v
"
"    vnoremap    v   <C-V>
"    vnoremap <C-V>     v
"

"====[ Always turn on syntax highlighting for diffs ]=========================

    " EITHER select by the file-suffix directly...
    "augroup PatchDiffHighlight
    "    autocmd!
    "    autocmd BufEnter  *.patch,*.rej,*.diff   syntax enable
    "augroup END

    " OR ELSE use the filetype mechanism to select automatically...
    filetype on
    augroup PatchDiffHighlight
        autocmd!
        autocmd FileType  diff   syntax enable
    augroup END

"====[ Open any file with a pre-existing swapfile in readonly mode "]=========

    augroup NoSimultaneousEdits
        autocmd!
        autocmd SwapExists * let v:swapchoice = 'o'
        autocmd SwapExists * echomsg ErrorMsg
        autocmd SwapExists * echo 'Duplicate edit session (readonly)'
        autocmd SwapExists * echohl None
        autocmd SwapExists * sleep 2
    augroup END

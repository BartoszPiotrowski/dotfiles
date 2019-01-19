set nocompatible

" runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" to install plugins run :PluginInstall

" Vundle plugin
Plugin 'gmarik/Vundle.vim'

" Plugins
" Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'auto-pairs-gentle'
Plugin 'chriskempson/base16-vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'Valloric/YouCompleteMe' -- installed via yaourt
"Plugin 'lervag/vimtex'
Plugin 'tpope/vim-surround'
Plugin 'git@github.com:hdima/python-syntax.git'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'chrisbra/csv.vim'
call vundle#end()

syntax enable
filetype plugin indent on
let python_highlight_all = 1
"let g:solarized_termcolors=256
set background=dark
colorscheme base16-solarized-dark

let g:filetype_pl="prolog"

set relativenumber
highlight LineNr ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNr ctermfg=DarkGrey ctermbg=NONE

set scrolloff=15

" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" let g:airline_theme='base16'
" Syntastic options
" let g:syntastic_python_checkers = ['flake8']
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Statusline
"set noruler
"set laststatus=2


set rulerformat=%50(%#Bold#\ %-t\ %m\ %#Bold#\ %4(%l:%c%V%)\ %k\ %4p%%%)

" easier moving between panes in vimdiff
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l


set breakindent
set linebreak
set showbreak=>
set tabstop=4
set shiftwidth=4

au BufNewFile,BufRead *.py
    \ set tabstop=8 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=85 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_filetype_blacklist = {}
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview

" copying to clipboard
set clipboard=unnamedplus

let g:vim_markdown_folding_disabled = 1

let g:AutoPairsUseInsertedCount = 1

" Remove whitespaces from the ends of lines on saving
autocmd BufWritePre * %s/\s\+$//e

" Sets working directory to this one of edited file
set autochdir
au CursorHold * checktime

" Sets default global replacement (:s/../../g)
set gdefault

" Highlighting
" set hlsearch
" search as characters are entered
" set incsearch
" turn off search highlight
nnoremap <space> :nohlsearch<CR>

" Vimtex compile shortcut
" nmap T :VimtexCompile<CR>


let g:tex_flavor = "latex"
let g:tex_fast = "cmMprsS"
let g:tex_conceal = ""
" let g:tex_fold_enabled = 0 -- this makes vim slow!!!
let g:tex_comment_nospell = 1
" here some advice if vim with tex slow:
" http://vim.1045645.n5.nabble.com/Slow-Syntax-Highlighting-with-Latex-td5716260.html

nmap <CR> gql

" substitute in all lines
nmap <C-s> :%s/

nmap <C-q> :q<CR>
nmap <C-w> :w<CR>
nmap <C-x> :x<CR>
"inoremap <Esc> <Esc>`^:w<CR>
"nnoremap <Esc> <Esc>:w<CR>

"command Pep execute ':!autopep8 -aaa --in-place %'

" set t_te=
" set t_ti=""
au VimLeave * :!clear

"nnoremap ; :

nmap PL :set spell spelllang=pl<CR>
nmap EN :set spell spelllang=en<CR>

" Abbreviations
iab wtw wtedy i tylko wtedy, gdy
iab fae następujące warunki są równoważne:
iab Fae Następujące warunki są równoważne:
iab nwsr następujące warunki są równoważne:
iab Nwsr Następujące warunki są równoważne:
iab Boo Bez utraty ogólności
iab boo bez utraty ogólności

" Doesn't work... From :grephelp Eatchar
"func Eatchar(pat)
"      let c = nr2char(getchar(0))
"      return (c =~ a:pat) ? '' : c
"endfunc
"iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>


" Define specific options for some file types
autocmd FileType plaintex,tex call ModeTex()

function! ModeTex()
	nmap <C-a> :w<CR> :! pdflatexclean %<CR>

	inoremap <buffer> FR \begin{frame}<CR>\end{frame}<Esc>k
	inoremap <buffer> SL \begin{frame}<CR>\end{frame}<Esc>k
	inoremap <buffer> BL \begin{block}<CR>\end{block}<Esc>k
	inoremap <buffer> EQ \begin{equation}<CR>\end{equation}<Esc>O
	inoremap <buffer> DF \begin{df}<CR>\end{df}<Esc>O
	inoremap <buffer> TH \begin{thm}<CR>\end{thm}<Esc>O
	inoremap <buffer> PR \begin{proof}<CR>\end{proof}<Esc>O
	inoremap <buffer> AL \begin{align*}<CR>\end{align*}<Esc>k
	inoremap <buffer> IT \begin{itemize}<CR>\end{itemize}<Esc>O\item<CR>\item<Up><Space>
 	inoremap <buffer> EN \begin{enumerate}<CR>\end{enumerate}<Esc>O\item<CR>\item<Up><Space>

 	iab E \exists \,<Left><Left><Left>
 	iab F \forall \,<Left><Left><Left>

 	iab \v \vee
 	iab \w \wedge
 	iab \V \bigvee_{}<Left>
 	iab \W \bigwedge_{}<Left>

 	inoremap <buffer> $ $$<esc>i

 	iab pr vdash
 	iab md models

 	iab x1n x_1, x_2, \ldots, x_n
 	iab x0n x_0, x_1, \ldots, x_n
 	iab y1n y_1, y_2, \ldots, y_n
 	iab y0n y_0, y_1, \ldots, y_n
 	iab k1n k_1, k_2, \ldots, k_n
 	iab k0n k_0, k_1, \ldots, k_n
 	iab l1n l_1, l_2, \ldots, l_n
 	iab l0n l_0, l_1, \ldots, l_n
 	iab a1n a_1, a_2, \ldots, a_n
 	iab a0n a_0, a_1, \ldots, a_n
 	iab b1n b_1, b_2, \ldots, b_n
 	iab b0n b_0, b_1, \ldots, b_n
 	iab p1n p_1, p_2, \ldots, p_n
 	iab p0n p_0, p_1, \ldots, p_n
 	iab q1n q_1, q_2, \ldots, q_n
 	iab q0n q_0, q_1, \ldots, q_n

 	iab x1k x_1, x_2, \ldots, x_k
 	iab x0k x_0, x_1, \ldots, x_k
 	iab y1k y_1, y_2, \ldots, y_k
 	iab y0k y_0, y_1, \ldots, y_k
 	iab i1k i_1, i_2, \ldots, i_k
 	iab i0k i_0, i_1, \ldots, i_k
 	iab l1k l_1, l_2, \ldots, l_k
 	iab l0k l_0, l_1, \ldots, l_k
 	iab a1k a_1, a_2, \ldots, a_k
 	iab a0k a_0, a_1, \ldots, a_k
 	iab b1k b_1, b_2, \ldots, b_k
 	iab b0k b_0, b_1, \ldots, b_k
 	iab p1k p_1, p_2, \ldots, p_k
 	iab p0k p_0, p_1, \ldots, p_k
 	iab q1k q_1, q_2, \ldots, q_k
 	iab q0k q_0, q_1, \ldots, q_k

 	iab x1l x_1, x_2, \ldots, x_l
 	iab x0l x_0, x_1, \ldots, x_l
 	iab y1l y_1, y_2, \ldots, y_l
 	iab y0l y_0, y_1, \ldots, y_l
 	iab i1l i_1, i_2, \ldots, i_l
 	iab i0l i_0, i_1, \ldots, i_l
 	iab l1l l_1, l_2, \ldots, l_l
 	iab l0l l_0, l_1, \ldots, l_l
 	iab a1l a_1, a_2, \ldots, a_l
 	iab a0l a_0, a_1, \ldots, a_l
 	iab b1l b_1, b_2, \ldots, b_l
 	iab b0l b_0, b_1, \ldots, b_l
 	iab p1l p_1, p_2, \ldots, p_l
 	iab p0l p_0, p_1, \ldots, p_l
 	iab q1l q_1, q_2, \ldots, q_l
 	iab q0l q_0, q_1, \ldots, q_l

 	iab a_ \bar{a}
 	iab b_ \bar{b}
 	iab c_ \bar{c}
 	iab x_ \bar{x}
 	iab y_ \bar{y}
 	iab z_ \bar{z}
 	iab p_ \bar{p}
 	iab q_ \bar{q}

	"iab EQ \begin{equation}<CR>\end{equation}<CR><Up><CR><Up><Tab><C-R><CR>
	"iab IT \begin{itemize}<CR>\end{itemize}<CR><Up><CR><Up><Tab><C-R><CR>
	"iab EN \begin{enumerate}<CR>\end{enumerate}<CR><Up><CR><Up><Tab><C-R><CR>

"	iab tw \begin{tw}<CR>\end{tw}<CR><Up><CR><Up><Tab><C-R><CR>
"	iab stw \begin{stw}<CR>\end{stw}<CR><Up><CR><Up><Tab>
"	iab wn \begin{wn}<CR>\end{wn}<CR><Up><CR><Up><Tab>
"	iab lem \begin{lem}<CR>\end{lem}<CR><Up><CR><Up><Tab>
"	iab tz \begin{teza}<CR>\end{teza}<CR><Up><CR><Up><Tab>
"	iab fkt \begin{fakt}<CR>\end{fakt}<CR><Up><CR><Up><Tab>
"	iab df \begin{df}<CR>\end{df}<CR><Up><CR><Up><Tab>
"	iab oznn \begin{oznn}<CR>\end{oznn}<CR><Up><CR><Up><Tab>
"	iab ozn \begin{ozn}<CR>\end{ozn}<CR><Up><CR><Up><Tab>
"	iab prz \begin{prz}<CR>\end{prz}<CR><Up><CR><Up><Tab>
"	iab uw \begin{uw}<CR>\end{uw}<CR><Up><CR><Up><Tab>
"	iab przyp \begin{przyp}<CR>\end{przyp}<CR><Up><CR><Up><Tab>
"	iab zd \begin{zd}<CR>\end{zd}<CR><Up><CR><Up><Tab>
"	iab dw \begin{proof}<CR>\end{proof}<CR><Up><CR><Up><Tab>
"
" 	iab $ $$<Left>
"	iab eq \[<CR>\]<CR><Up><CR><Up><Tab>
endfunction



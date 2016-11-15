set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'moll/vim-node'
Bundle 'walm/jshint.vim'
Bundle 'godlygeek/tabular'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'digitaltoad/vim-jade'
"Bundle 'ternjs/tern_for_vim'
Bundle 'bling/vim-airline'
Bundle 'yonchu/accelerated-smooth-scroll'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" personal conf
syntax on
let mapleader = "\<Space>"
color desert
set t_Co=256
set nu
set nocursorline
"hi CursorLine cterm=bold
" disable bold font
set t_md=

set t_ti= t_te=

set laststatus=2

if (exists('+colorcolumn'))
    set colorcolumn=120
    highlight ColorColumn ctermbg=gray
endif
set colorcolumn=0

"" encodings configure
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,latin1
set fileformats=unix,dos,mac

set ttymouse=xterm2
set mouse=nv
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

""wildignore
set wildmenu "Turn on WiLd menu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*
set wildignore+=./node_modules/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
"set noswapfile
set directory=$HOME/.vim/swapfiles//
" reopening a file
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" make backspace work like most other apps
set backspace=2

"" set tabstop value and shift width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set incsearch
hi IncSearch cterm=NONE ctermfg=NONE ctermbg=darkgrey
hi Search cterm=NONE ctermfg=NONE ctermbg=darkgrey

"" Cold Folding
set foldmethod=indent
set foldlevelstart=100
set foldlevel=99

"" Define custom indentation for filetypes
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType jade :setlocal sw=2 ts=2 sts=2
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType coffee :setlocal sw=2 ts=2 sts=2
autocmd FileType json :setlocal sw=2 ts=2 sts=2
autocmd FileType dust :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby,eruby :setlocal sw=2 ts=2 sts=2

" -------------------------------------
" unite conf
nnoremap <leader>f :<C-u>Unite -start-insert file<cr>
nnoremap <leader><space> :<C-u>Unite -start-insert file_rec<cr>

" syntastic conf
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python"] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--ignore=E402 --max-line-length=160"
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_coffee_coffeelint_args = "--file ~/.vim/coffeelint.json"
map <leader>c :SyntasticCheck<CR>
map <leader>r :SyntasticReset<CR>

let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 26
map tr :NERDTreeToggle<cr>
let NERDTreeIgnore = ['.*\.o$','.*\.ko$','.*\.gz$', '.*\.pyc', '.*\.gitignore', '.DS_Store']

map tb :Tagbar<cr>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 26
let g:tagbar_left= 1

nmap <space>= :Tabularize /=<CR>
vmap <space>= :Tabularize /=<CR>
nmap <space>=: :Tabularize /:\zs<CR>
vmap <space>=: :Tabularize /:\zs<CR>

" for python
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

" for json
let g:vim_json_warnings=0

" for coffee
vmap <leader>cc <esc>:'<,'>:CoffeeCompile<CR>
map <leader>cc :CoffeeCompile<CR>

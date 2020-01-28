set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ludovicchabant/vim-gutentags'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/deoplete-zsh'
Plugin 'zchee/deoplete-go', {'for': 'go'}

Plugin 'python-mode/python-mode', {'for': ['python', 'py']}
Plugin 'integralist/vim-mypy', {'for': ['python', 'py']}
Plugin 'zchee/deoplete-jedi', {'for': ['python', 'py']}

Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['md', 'markdown'] }
Plugin 'dhruvasagar/vim-table-mode', {'for': ['markdown', 'md']}

Plugin 'Quramy/tsuquyomi', {'for': ['typescript', 'ts']} " might require vimproc
Plugin 'leafgarland/typescript-vim', {'for': ['typescript', 'ts']}
Plugin 'Quramy/vim-js-pretty-template', {'for': ['js', 'javascript', 'typescript', 'ts']}

Plugin 'janko-m/vim-test'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" VIM behaviour ========================================================== {{{

    "  Tell VIM to remember certain things when we exit
    "  '10  :  marks will be remembered for up to 10 previously edited files
    "  "100 :  will save up to 100 lines for each register
    "  :20  :  up to 20 lines of command-line history will be remembered
    "  %    :  saves and restores the buffer list
    "  n... :  where to save the viminfo files
    set viminfo='10,\"100,:20,%,n~/.vim/backup/.viminfo

    " Show (partial) command in the last line of the screen.
    set showcmd

    " GUI settings
    set title

    " Don't update the display while executing macros
    set lazyredraw

    " Always display a status line at the bottom of the window
    set laststatus=2

    " Keep 3 lines visible down from the cursor while scrolling
    set scrolloff=3

    " Enable ctags support
    set tags=./tags;/

    " If file is not modified in VIM but changed outside, reload it
    set autoread

    " Keep commands history longer (by default keeps only 20 commands)
    set history=1000

    " Shows information on VIM bottom
    set ruler

    " Show line numbers in editor
    set number

    " Ignore case in search and replace
    set ignorecase

    " Found text will be highlighted and search will be repeated over file
    set incsearch

    " Smart search: if lowercase ignore case of matches, if not case-sensitive
    set smartcase

    " Keep VIM history even file is closed
    set viminfo='20,<50,s10,h

    " Remove trailing spaces after save
    au BufWritePre * silent g/\s\+$/s///

    " Set fold level to open all methods arround
    set foldlevel=100

    " enable per-project settings files
    set exrc

" }}}
" Edit behaviour ========================================================= {{{

    " Encoding
    set termencoding=utf-8
    set encoding=utf-8

    " Set tab to 4 spaces
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

    " Enable wrap mode to see long code lines
    set wrap
    set textwidth=0

    " Enable mouse features
    set mouse=a

    " For new lines automatically indent by current line indent
    set autoindent
    set copyindent

    " Show matching for symbols like () and etc.
    set showmatch

    " Allow backspace on everything in insert mode
    set backspace=indent,eol,start

    " Word wrap not in the middle of the word
    set formatoptions=l
    set lbr

" }}}
" Edit behaviour based on fyle type ====================================== {{{

    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
    autocmd Filetype js setlocal ts=2 sts=2 sw=2

" }}}
" Backups and swap ======================================================= {{{

    set backup
    set backupdir=~/.vim/backup
    set noswapfile

" }}}
" Mappings =============================================================== {{{

    " Mapleader from \ to ,
    let mapleader=","

    " <SHIFT + t> - trim white spaces in lines end
    map <s-t> :%s/ \+$//g<CR>

    " Toggles non printable character visibility
    nmap <silent> <leader>w :set nolist!<CR>

    " Allow to overwrite root protected files (in case of missed sudo)
    cmap w!! %!sudo tee > /dev/null %

    " Toggle NERDtree
    map <leader>n :NERDTreeToggle<CR>

    " TagBar Toggle
    map <leader>m :TagbarToggle<CR>

    " Spell Check
    map <F5> <Esc>:setlocal spell spelllang=lt<CR>
    map <F6> <Esc>:setlocal spell spelllang=en_us<CR>
    map <F7> <Esc>:setlocal nospell<CR>

    " No autoindent in paste mode
    set pastetoggle=<F2>

    " Clean search highlight on space
    nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

    " Insert new line after the cursor
    nmap <CR> i<Enter><Esc>l

    " Text wrap navigation made easy
    map j gj
    map k gk

    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv

    " Resize windows with arrows
    nmap <left> :3wincmd <<cr>
    nmap <right> :3wincmd ><cr>
    nmap <up> :3wincmd +<cr>
    nmap <down> :3wincmd -<cr>

    " Window close
    map <leader>wc :wincmd q<cr>

    " Window rotate
    map <leader>wr <C-W>r

    " Alias to ^w
    nmap <C-q> <C-w>

    " Terminal escape
    tnoremap <C-[> <C-\><C-n>
    tnoremap <Esc> <C-\><C-n>

    " Terminal init
    nmap <leader>t :terminal<cr>

    " Tab Complete
    inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"

    " Insert new line above cursor
    nmap <C-K> O<Esc>j
    " Insert new line below cursor
    nmap <C-J> o<Esc>k
    " Insert space after cursor
    nmap <C-L> li <Esc>h
    " Insert space before cursor
    nmap <C-H> i <Esc>l

" }}}
" File types options ===================================================== {{{

    " Ignore these file types on :e
    set wildmenu
    set wildmode=list:longest
    set wildignore=*.swp,*.bak,*.pyc

    " fuzzy :find
    set path+=**

" }}}
" Omnicomplete =========================================================== {{{

    "set completeopt=menuone,longest

" }}}
" Colors ================================================================= {{{

    " Enable syntax highlighting
    syntax on
    let g:gruvbox_italic=1
    set termguicolors

    " Set Color scheme
    colorscheme gruvbox

    " Enable CursorLine
    set cursorline

    "" Paint 80 symbols line
    set colorcolumn=80

    set background=dark

" }}}
" Plugin Settings ======================================================== {{{

    " NERDTree
    let NERDTreeMinimalUI=1
    let NERDTreeDirArrows=1
    let NERDTreeIgnore=['\.pyc$', '\.bak$', '\.swp$', '__pycache__$', '\.egg-info$']

    " Airline
    let g:airline_powerline_fonts = 1

    " Deoplete
    let g:deoplete#enable_at_startup = 1

    " Fugitive
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
    autocmd BufReadPost fugitive://* set bufhidden=delete

" }}}

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/domas/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/domas/.cache/dein')
  call dein#begin('/home/domas/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/domas/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')

  "call dein#add('roxma/nvim-completion-manager')
  "call dein#add('jsfaint/gen_tags.vim')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('ludovicchabant/vim-gutentags')

  call dein#add('zchee/deoplete-jedi')
  call dein#add('Shougo/deoplete-zsh')
  call dein#add('zchee/deoplete-go')

  call dein#add('klen/python-mode')
  call dein#add('ehamberg/vim-cute-python')
  call dein#add('tpope/vim-fugitive')
  call dein#add('scrooloose/syntastic')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('dhruvasagar/vim-table-mode')

  call dein#add('fatih/vim-go')
  call dein#add('janko-m/vim-test')

  call dein#add('morhetz/gruvbox')

  call dein#add('euclio/vim-markdown-composer', {'build': 'cargo build --release'})
  call dein#add('Rykka/riv.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

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

    " Simple Copy to system clipboard
    vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

    " Simple paste in insert mode
    imap <C-v> <Esc><C-v>a

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

    " Denite
    nnoremap <C-o> :Denite -auto-resize file_rec<cr>
    nnoremap <C-O> :DeniteBufferDir -auto-resize file_rec<cr>
    nnoremap <leader>/ :Denite -auto-resize grep:.<cr>
    nnoremap <leader>s :Denite -auto-resize buffer<cr>

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

    " Python mode
    let g:pymode_python = 'python2'

" }}}

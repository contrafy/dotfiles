inoremap jj <Esc>
set nocompatible                " Be iMproved, required
filetype plugin indent on       " Required for plugins
syntax on                       " Enable syntax highlighting
set encoding=utf-8              " Use UTF-8 encoding
set fileencoding=utf-8          " Use UTF-8 encoding for written files
set hidden                      " Allow hidden buffers
set updatetime=300              " Faster completion
set timeoutlen=500              " Faster key sequence completion
set mouse=a                     " Enable mouse in all modes
set backspace=indent,eol,start  " Make backspace behave normally
set history=1000                " Store more history
set autoread                    " Auto reload changed files
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set signcolumn=yes              " Always show signcolumn
set noshowmode                  " Don't show mode (lightline will do that)
set laststatus=2                " Always show status line
set cmdheight=1                 " Command line height
set showmatch                   " Show matching brackets
set matchtime=2                 " Blink matching brackets
set shortmess+=c                " Don't pass messages to completion menu
set completeopt=menuone,noinsert,noselect " Better completion experience
set wildmenu                    " Better command-line completion
set wildmode=list:longest,full  " Command completion mode
set lazyredraw                  " For performance
set ttyfast                     " Improves redrawing for newer computers
set visualbell                  " No sounds
set noerrorbells                " No bells
set scrolloff=8                 " Context lines visible when scrolling
set sidescrolloff=8             " Context columns visible when scrolling
set splitright                  " Split vertical windows to the right
set splitbelow                  " Split horizontal windows below
set clipboard^=unnamed,unnamedplus " Use system clipboard

" ----------------------
" Performance Options
" ----------------------
set synmaxcol=200               " Only highlight first 200 columns
set nocursorline                " Don't highlight current line (faster)
set noswapfile                  " No swap file (faster)
set nobackup                    " No backup file (faster)
set nowritebackup               " No backup while editing (faster)
if has('persistent_undo')
  set undofile                  " Enable persistent undo
  set undodir=$HOME/.vim/undo   " Set undo directory
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

" ----------------------
" Tab & Indentation
" ----------------------
set tabstop=2                   " Width of tab character
set softtabstop=2               " Fine tunes amount of whitespace
set shiftwidth=2                " Width for autoindents
set expandtab                   " Converts tabs to spaces
set smartindent                 " Makes indenting smart
set autoindent                  " Good auto indent
set wrap                        " Wrap lines
set linebreak                   " Wrap on word boundary
set breakindent                 " Indent wrapped lines to match start

" Make sure >> and << use spaces instead of tabs
set cinoptions=(0,u0,U0

" ----------------------
" Search Settings
" ----------------------
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search results
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uppercase present
set inccommand=split            " Live preview of substitutions (for neovim)



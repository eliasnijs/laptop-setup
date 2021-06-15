call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'stefanvanburen/rams.vim'
call plug#end()

set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions

syntax on                   " syntax highlighting
filetype plugin indent on   " allow auto-indenting depending on file type
set tabstop=3               " number of columns occupied by a tab character
set expandtab               " convert tabs to white space
set shiftwidth=3            " width for autoindents
set softtabstop=3           " see multiple spaces as tabstops so <BS> does the right thing

colorscheme rams

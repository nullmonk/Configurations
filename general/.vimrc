color elflord 
syntax on
set number" Show line numbers
set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch       " Highlight matching brace
set visualbell      " Use visual bell (no beeping)
set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set ignorecase      " Always case-insensitive
set incsearch       " Searches for strings incrementally
set autoindent      " Auto-indent new lines
set shiftwidth=4    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab
set expandtab       " Expand tabs into spaces
set wildmenu        " Tab through menus
set wildignore=*.o,*~,*.pyc,*/.git/*    " Ignore certain file endings
set mouse=a         " Enable mouse mode
set autoread        " Read changed files automatically
set noerrorbells    " Silence errors
set novisualbell
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    set encoding=utf8
endif
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 " Parse Yaml files differently

match ErrorMsg '\%>81v.\+' " Highlight text over 80 characters wide

"" Advanced
set ruler           " Show row and column ruler information
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

"" Allows Toggling between relative and absolute numbers with CTRL+n
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set rnu!
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


set rnu
set number
"" Set and unset relative line numbers depending on mode
autocmd InsertEnter * :set rnu!
autocmd InsertLeave * :set rnu
:au FocusLost * :set rnu!
:au FocusGained * :set relativenumber


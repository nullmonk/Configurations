color elflord 
syntax on
set mouse=a             " Enable Mouse mode
set linebreak           " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=0         " Line wrap (number of cols)
set showmatch           " Highlight matching brace
set visualbell          " Use visual bell (no beeping)
set hlsearch            " Highlight all search results
set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive
set incsearch           " Searches for strings incrementally
set autoindent          " Auto-indent new lines
set shiftwidth=4        " Number of auto-indent spaces
set smarttab            " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab
set expandtab           " Expand tabs into spaces
set ruler               " Show row and column ruler information
set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" line numbers
set rnu                 " rnu = relativenumber
set number
autocmd InsertEnter * :set rnu!
autocmd InsertLeave * :set rnu

" Tab completion
set wildmenu
set wildignore+=*.ko,*.pyc,*.swp,*.o

" Syntax highlighting
" Spaces before a tab
syn match ErrorMsg / \+\ze\t/
" 150 Chars or more
syn match ErrorMsg /\%>150v[^()\{\}\[\]<>]\+/
" Whitespace at the end of a line where the cursor isnt
autocmd InsertEnter * match ErrorMsg /\s\+\%#\@<!$/
" All whitespace at the end of a line
autocmd InsertLeave * match ErrorMsg /\s\+$/

" Cleanup Trailing whitespace on exit
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> %s/\s\+$//e

function s:CleanupSpaces()
    let _search=@/
    :%s/\s\+$//e
    let @/=_search
endfunction

" Do different things dependig on the file type
autocmd BufNewFile,BufRead *Makefile   set noexpandtab
autocmd BufNewFile,BufRead *.gs   set syntax=javascript

" Yaml files
autocmd FileType yaml call s:YamlStyle()
function s:YamlStyle()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction


" C Kernel Style guide
autocmd FileType c,cpp,h call s:KernelStyleC()
function s:KernelStyleC()
    " Set tab styles to 8 and use tabs not spaces
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab
    " Auto continue comment blocks
    setlocal formatoptions+=cro
    setlocal cindent
    setlocal cinoptions=:0,l1,t0,g0,(0
    " Random syntax keywords found online
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
    syn keyword cType __u8 __u16 __u32 __u64 __s8 __s16 __s32 __s64
endfunction

" Python files
autocmd FileType py call s:PythonStyle()
function s:PythonStyle()
    " Error 81 Chars or more
    syn match ErrorMsg /\%>80v[^()\{\}\[\]<>]\+/
endfunction

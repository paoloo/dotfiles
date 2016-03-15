
set fileencodings=utf-8,latin1,cp1251
filetype plugin indent on	" enable filetype dectection and ft specific plugin/indent
syntax on			" enable syntax hightlight and completion

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
" search
set incsearch
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set nofoldenable		" disable folding"
set confirm
set backspace=indent,eol,start
set t_Co=256			" terminal has 256 colors
set background=dark
set mouse=a			" use mouse in All modes
set report=0			" always report number of lines changed
set nowrap			" dont wrap lines
set scrolloff=5			" 5 lines above/below cursor when scrolling
set number			" show line numbers
set showmatch			" show matching bracket (briefly jump)
set showcmd			" show typed command in status bar
set title			" show file in titlebar
set laststatus=1		" use 1 line for the status bar
set matchtime=2			" show matching bracket for 0.2 seconds

" Default Indentation adjust for C
set autoindent
set expandtab			" expand tab to space
set smartindent			" indent when
set tabstop=2			" tab width
set softtabstop=2		" backspace
set shiftwidth=2		" indent width

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79	" PEP 8
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
scriptencoding utf-8
set encoding=utf-8

" ======== Keymaps
so ~/.config/nvim/keymap.vim
nnoremap <C-tab> :tabnext<CR>

" ======== Vundle Initialization
so ~/.config/nvim/plugs.vim

" ======== General Config
set backspace=indent,eol,start
set history=100
set showcmd
set ignorecase
set autoread
set mouse=a
let mapleader=","

" ======== Appearance
set background=dark
syntax on
syntax enable
set hlsearch
colorscheme dracula
set showmode
set t_Co=256
set t_ut=
set t_vb=""
set visualbell
set cursorline
set colorcolumn=80
set clipboard=unnamed
set number
set hidden
set list
set listchars=trail:·,tab:┊\ ,eol:¬
set lcs+=space:·
let $nvim_tui_enable_true_color=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ======== Dracula theme configs
let g:dracula_italic = 1
let g:dracula_bold = 1
highlight Normal ctermbg=None
highlight SpecialKey ctermfg=60 guifg=#B6B6C8
highlight Whitespace ctermfg=60 guifg=#B6B6C8

" ======== Remove unused languages from polyglot
let g:polyglot_disabled = ['acpiasl', 'apiblueprint', 'applescript', 'arduino', 'asciidoc', 'autohotkey', 'blade', 'c++11', 'c/c++', 'caddyfile', 'carp', 'cjsx', 'clojure', 'coffee-script', 'cql', 'cryptol', 'crystal', 'cucumber', 'cue', 'dart', 'dhall', 'dlang', 'elixir', 'elm', 'emberscript', 'emblem', 'erlang', 'ferm', 'fish', 'flatbuffers', 'fsharp', 'glsl', 'gmpl', 'gnuplot', 'graphql', 'haml', 'handlebars', 'haskell', 'haxe', 'hive', 'i3', 'idris', 'ion', 'jasmine', 'javascript', 'jst', 'jsx', 'julia', 'kotlin', 'latex', 'less', 'lilypond', 'livescript', 'llvm', 'lua', 'mako', 'mathematica', 'mdx', 'meson', 'moonscript', 'nim', 'nix', 'objc', 'ocaml', 'octave', 'opencl', 'perl', 'php', 'plantuml', 'pony', 'powershell', 'protobuf', 'pug', 'puppet', 'purescript', 'qml', 'r-lang', 'racket', 'ragel', 'raml', 'reason', 'rst', 'rust', 'sbt', 'scala', 'scss', 'slim', 'slime', 'smt2', 'solidity', 'stylus', 'svelte', 'svg-indent', 'svg', 'swift', 'sxhkd', 'textile', 'thrift', 'tomdoc', 'toml', 'tptp', 'twig', 'typescript', 'v', 'vala', 'vbnet', 'vcl', 'vifm', 'vm', 'vue', 'xdc', 'xls', 'xml', 'yaml', 'yard', 'zephir', 'zig']

" ======== Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" ======== Persistent Undo
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/.backups > /dev/null 2>&1
  set undodir=~/.config/nvim/.backups
  set undofile
endif

" ======== Indentation & tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap
set linebreak
filetype plugin on
filetype indent on

" ======== Completion
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/target/*
set wildignore+=*.class
set wildignore+=*.pyc

" ======== Scrolling
set lazyredraw
set ttyfast
set scrolloff=27
set sidescrolloff=27
set sidescroll=1

" ======== NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden = 1
let NERDTreeMapOpenVSplit='v'

 " ======== FZF mapping
let g:fzf_layout = { 'window': 'enew' }
nnoremap <silent> <C-P> :FZF<cr>
nnoremap <silent> <leader>a :Ag<cr>
augroup localfzf
  autocmd!
  autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
  autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
  autocmd VimEnter * command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>,
        \                 <bang>0 ? fzf#vim#with_preview('up:60%')
        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \                 <bang>0)
augroup END
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" ======== Bash configs
autocmd FileType sh setlocal
  \ autoindent
  \ noexpandtab
  \ tabstop=4
  \ shiftwidth=4

" ======== Vim Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_detect_modified=1

" ======== ViM Terraform
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='#%s'
let g:terraform_fmt_on_save=1

" ======== Aleconfig
let g:ale_completion_enabled = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_python_pylint_change_directory = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_list_window_size = 5
let g:ale_fixers = {
  \'*':          ['remove_trailing_lines', 'trim_whitespace'],
  \'python':     ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'autopep8', 'isort'],
  \'tf':         ['remove_trailing_lines', 'trim_whitespace', 'terraform'],
  \'json':       ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
  \'yaml':       ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
  \'ruby':       ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'rufo'],
  \'go':         ['remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_linters = {
  \'dockerfile': ['hadolint'],
  \'python':     ['pylint'],
  \'tf':         ['tflint'],
  \'ruby':       ['reek', 'standardrb', 'rubocop'],
  \'yaml':       ['yamllint']
\}

" ======== YAML Settings
au BufNewFile,BufRead *.yaml,*.yml so ~/.config/nvim/syntax/yaml.vim

" ======== Golang Settings
let g:go_fmt_command = "goimports"
au BufNewFile,BufRead *.go so ~/.config/nvim/syntax/golang.vim

" ======== Bash Settings
au BufNewFile,BufRead *.sh,*.zsh setf sh

augroup customFileTypes

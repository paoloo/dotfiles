call plug#begin('~/.config/nvim/plugged')
" On-demand loading
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/bufkill.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform'
Plug 'towolf/vim-helm'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chr4/nginx.vim'
call plug#end()

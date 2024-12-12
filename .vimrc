" Enable filetype plugin for C, C++, and Rust
autocmd FileType c,cpp,rust setlocal shiftwidth=4 tabstop=4 expandtab " For consistent indentation

" ============================
" Plugin Management (Vundle)
" ============================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Core Plugins
Plugin 'gmarik/Vundle.vim'                 " Vundle plugin manager
Plugin 'vim-airline/vim-airline'           " Status line plugin
Plugin 'morhetz/gruvbox'                  " Gruvbox color scheme
Plugin 'joshdick/onedark.vim'             " OneDark color scheme

" File Navigation Plugins
Plugin 'preservim/nerdtree'               " NERDTree for file navigation
Plugin 'Xuyuanp/nerdtree-git-plugin'      " Git plugin for NERDTree
Plugin 'nvim-neo-tree/neo-tree.nvim'      " NeoTree for file navigation
Plugin 'junegunn/fzf.vim'                   " fzf for working with files

" Coding Utilities
Plugin 'tpope/vim-fugitive'               " Git integration
Plugin 'mattn/emmet-vim'                  " Emmet for HTML/CSS
"Plugin 'frazrepo/vim-rainbow'             " Rainbow parentheses
Plugin 'tpope/vim-surround'               " Surround text objects
Plugin 'ryanoasis/vim-devicons'           " Devicons for file types
"Plugin 'jiangmiao/auto-pairs'             " Auto pairs for brackets/quotes

" ============================
" C/C++ Specific Plugins
" ============================
Plugin 'neoclide/coc.nvim'                " Intellisense for C, C++, Rust using Language Server Protocol (LSP)
Plugin 'vim-syntastic/syntastic'          " Syntax checking
Plugin 'rust-lang/rust.vim'              " Rust syntax and features
Plugin 'octol/vim-cpp-enhanced-highlight' " Enhanced C/C++ highlighting
Plugin 'majutsushi/tagbar'               " Display code structure in a sidebar

" ============================
" Rust Specific Plugins
" ============================
Plugin 'simrat39/rust-tools.nvim'        " Rust-specific tools for LSP, formatting, and completion
Plugin 'dense-analysis/ale'              " Asynchronous Lint Engine (ALE) for Rust and C/C++

" ============================
" Plugin Management End
" ============================
call vundle#end()

" ============================
" NERDTree Configuration
" ============================
autocmd VimEnter * NERDTree | wincmd p    " Open NERDTree on startup
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
map <C-n> :NERDTreeToggle<CR>             " Toggle NERDTree with Ctrl+n
map <C-f> :NERDTreeFind<CR>              " Find current file in NERDTree

" ============================
" Airline Configuration
" ============================
let g:airline_powerline_fonts = 1         " Enable powerline fonts for airline
let g:airline#extensions#tabline#formatter = 'default'   " Set default tabline formatter
let g:airline#extensions#tabline#enabled = 1   " Enable tabline extension

" ============================
" Highlighting and Colors
" ============================
au BufRead,BufNewFile * match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=darkred  " Highlight trailing spaces in red
colorscheme gruvbox                       " Use the Gruvbox color scheme
set background=dark                      " Set dark background

" Syntax Highlighting (For C, C++, Rust)
if has('syntax')
  syntax on
endif

" ============================
" Whitespace Settings
" ============================
set list                               " Show whitespace characters
set listchars=tab:▸\ ,trail:·           " Display tabs and trailing spaces with special symbols

" ============================
" Basic Settings
" ============================
set autoindent
set encoding=utf-8
set number relativenumber
set shiftwidth=4
set tabstop=4
set expandtab
set hlsearch
set ignorecase
set smartcase
set incsearch
set hidden
set wildmenu
set wildignore=*.swp,*.bak,*.pyc
set path+=**
set laststatus=2
set ruler
set showcmd
set mouse=a
set cmdheight=2
set ttimeoutlen=200
set visualbell
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
autocmd FileType * inoremap <silent> <BS> <C-W>

" ============================
" Key Mappings
" ============================
inoremap jj <ESC>                       " Map 'jj' to Escape in insert mode
map Y y$                                " Map 'Y' to yank till end of line

" ============================
" C/C++ Specific Settings
" ============================
let g:coc_global_extensions = ['coc-clangd', 'coc-ccls', 'coc-pyright', 'coc-rust-analyzer'] " Enable coc extensions for C/C++ using clangd or ccls

" ============================
" Rust-Specific Settings
" ============================
let g:python_highlight_all = 1          " Enable syntax highlighting for all Python objects
let g:rustfmt_autosave = 1              " Enable auto-formatting for Rust files

" ============================
" Custom Git Status Indicators (NERDTree)
" ============================
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ 'Modified'  :'✹',
\ 'Staged'    :'✚',
\ 'Untracked' :'✭',
\ 'Renamed'   :'➜',
\ 'Unmerged'  :'═',
\ 'Deleted'   :'✖',
\ 'Dirty'     :'✗',
\ 'Ignored'   :'☒',
\ 'Clean'     :'✔︎',
\ 'Unknown'   :'?'
\ }

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" fzf shortcuts
nnoremap \f :Files<CR>
nnoremap \b :Buffers<CR>
nnoremap \h :History<CR>

" ============================================================
" VIM CONFIGURATION
" Vim - NOT Neovim
"
" Philosophy:
" Keep the original configuration intact.
" Add professional development features without breaking
" the existing workflow.
" ============================================================


" ============================================================
" 1. FILETYPE / INDENTATION
" ============================================================

filetype plugin indent on

autocmd FileType c,cpp,rust setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab


" ============================================================
" 2. PLUGIN MANAGEMENT - VIM-PLUG
" ============================================================

call plug#begin('~/.vim/plugged')


" ------------------------------------------------------------
" Core / UI
" ------------------------------------------------------------

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ghifarit53/tokyonight-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'utensils/colors.vim'


" ------------------------------------------------------------
" File Navigation
" ------------------------------------------------------------

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'


" ------------------------------------------------------------
" Git
" ------------------------------------------------------------

Plug 'tpope/vim-fugitive'


" ------------------------------------------------------------
" Coding Utilities
" ------------------------------------------------------------

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'


" ------------------------------------------------------------
" Color Schemes
" ------------------------------------------------------------

Plug 'srcery-colors/srcery-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'


" ------------------------------------------------------------
" C / C++
" ------------------------------------------------------------

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'octol/vim-cpp-enhanced-highlight'


" ------------------------------------------------------------
" Rust
" ------------------------------------------------------------

Plug 'rust-lang/rust.vim'


" ------------------------------------------------------------
" Linting / Formatting
" ------------------------------------------------------------

Plug 'dense-analysis/ale'


" ------------------------------------------------------------
" Code Structure
" ------------------------------------------------------------

Plug 'majutsushi/tagbar'


" ------------------------------------------------------------
" Debugger
" ------------------------------------------------------------

Plug 'puremourning/vimspector'


call plug#end()


" ============================================================
" 3. BASIC VIM SETTINGS
" ============================================================

set encoding=utf-8
scriptencoding utf-8

set number
set relativenumber

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set autoindent
set smartindent

set cinoptions=:0,l1,g0,t0,(0

set hlsearch
set ignorecase
set smartcase
set incsearch

set hidden

set wildmenu
set wildmode=longest:full,full

set wildignore=*.swp,*.bak,*.pyc
set wildignore+=*/.git/*
set wildignore+=*/node_modules/*
set wildignore+=*/target/*
set wildignore+=*/build/*
set wildignore+=*/dist/*
set wildignore+=*/__pycache__/*

set path+=**

set laststatus=2
set ruler
set showcmd

set mouse=a

set cmdheight=2

set ttimeoutlen=200

set visualbell

set splitbelow
set splitright

set scrolloff=5
set sidescrolloff=5

set signcolumn=yes

set updatetime=300


" ============================================================
" 4. UNDO / BACKUP / SWAP
" ============================================================

set undofile

let s:vim_data_dir = expand('~/.vim')

if !isdirectory(s:vim_data_dir . '/undodir')
  call mkdir(s:vim_data_dir . '/undodir', 'p')
endif

if !isdirectory(s:vim_data_dir . '/backup')
  call mkdir(s:vim_data_dir . '/backup', 'p')
endif

if !isdirectory(s:vim_data_dir . '/swap')
  call mkdir(s:vim_data_dir . '/swap', 'p')
endif

set undodir=~/.vim/undodir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


" ============================================================
" 5. SYNTAX HIGHLIGHTING
" ============================================================

if has('syntax')
  syntax on
endif


" ============================================================
" 6. COLOR SCHEME
" ============================================================

set background=dark

colorscheme tokyonight


" ============================================================
" 7. WHITESPACE
" ============================================================

set list
set listchars=tab:▸\ ,trail:·

augroup BadWhitespace
  autocmd!
  autocmd BufRead,BufNewFile *
        \ match BadWhitespace /\s\+$/
augroup END

highlight BadWhitespace ctermbg=red guibg=darkred


" ============================================================
" 8. FOLDING
" ============================================================

set foldmethod=syntax
set foldlevel=99
set foldenable

nnoremap <leader>za za
nnoremap <leader>zo zo
nnoremap <leader>zc zc
nnoremap <leader>zR zR
nnoremap <leader>zM zM


" ============================================================
" 9. NERDTree
"
" Original behavior preserved:
" NERDTree opens when Vim starts.
" Cursor returns to editing window.
" ============================================================

autocmd VimEnter * NERDTree | wincmd p

autocmd BufEnter *
      \ if tabpagenr('$') == 1 &&
      \ winnr('$') == 1 &&
      \ exists('b:NERDTree') &&
      \ b:NERDTree.isTabTree() |
      \ quit |
      \ endif

map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>


" NERDTree options
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeAutoDeleteBuffer = 1


" ============================================================
" 10. NERDTree GIT STATUS
" ============================================================

let g:NERDTreeGitStatusIndicatorMapCustom = {
\ 'Modified'  :'✹',
\ 'Staged'    :'✚',
\ 'Untracked' :'✭',
\ 'Renamed'   :'➜',
\ 'Unmerged'  :'═',
\ 'Deleted'   :'✖',
\ 'Dirty'     :'✗',
\ 'Ignored'   :'☒',
\ 'Clean'     :'✔',
\ 'Unknown'   :'?'
\ }


" ============================================================
" 11. AIRLINE
" ============================================================

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#hunks#enabled = 1


" ============================================================
" 12. LEADER KEY
" ============================================================

let mapleader = " "
let maplocalleader = ","


" ============================================================
" 13. ORIGINAL KEY MAPPINGS
" ============================================================

inoremap jj <ESC>

map Y y$

map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>


" ============================================================
" 14. AUTO PAIRS
"
" Kept from original configuration.
" ============================================================

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i


" ============================================================
" 15. FZF
" ============================================================

if executable('fzf')
  nnoremap \f :Files<CR>
  nnoremap \b :Buffers<CR>
  nnoremap \h :History<CR>

  nnoremap <silent> <leader>ff :Files<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>fh :History<CR>
endif


" ============================================================
" 16. RIPGREP
" ============================================================

if executable('rg')

  let $FZF_DEFAULT_COMMAND =
        \ 'rg --files --hidden --follow '
        \ . '--glob "!.git/*" '
        \ . '--glob "!node_modules/*" '
        \ . '--glob "!target/*" '
        \ . '--glob "!build/*" '

  command! -bang -nargs=* RG
        \ call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading '
        \ . '--color=always --smart-case '
        \ . shellescape(<q-args>),
        \ 1,
        \ fzf#vim#with_preview(),
        \ <bang>0)

  nnoremap <silent> <leader>fg :RG<CR>

endif


" ============================================================
" 17. COC - LSP
" ============================================================

let g:coc_global_extensions = [
\ 'coc-clangd',
\ 'coc-rust-analyzer',
\ 'coc-pyright'
\ ]


" ============================================================
" 18. COC COMPLETION
" ============================================================

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ?
      \ coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ?
      \ coc#pum#prev(1) :
      \ "\<C-h>"

inoremap <silent><expr> <CR>
      \ coc#pum#visible() ?
      \ coc#pum#confirm() :
      \ "\<CR>"

inoremap <silent><expr> <C-Space> coc#refresh()

inoremap <silent><expr> <C-e>
      \ coc#pum#visible() ?
      \ coc#pum#cancel() :
      \ "\<C-e>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction


" ============================================================
" 19. COC LSP KEYMAPS
" ============================================================

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)

nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction)

nnoremap <silent> K :call CocActionAsync('doHover')<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <leader>dd :CocDiagnostics<CR>

nnoremap <silent> <leader>fm :call CocActionAsync('format')<CR>

nnoremap <silent> <leader>oi :call CocActionAsync('organizeImport')<CR>


" ============================================================
" 20. COC DIAGNOSTICS
" ============================================================

autocmd CursorHold * silent call CocActionAsync('highlight')


" ============================================================
" 21. ALE
"
" ALE does NOT run LSP.
" Coc is the LSP engine.
" ALE handles external linting / formatting.
" ============================================================

let g:ale_disable_lsp = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_virtualtext_cursor = 1

let g:ale_fix_on_save = 0


let g:ale_linters = {
\ 'c': ['clangtidy'],
\ 'cpp': ['clangtidy'],
\ 'rust': ['cargo', 'clippy'],
\ 'python': ['ruff']
\ }


let g:ale_fixers = {
\ 'c': ['clang-format'],
\ 'cpp': ['clang-format'],
\ 'rust': ['rustfmt'],
\ 'python': ['ruff_format']
\ }


nnoremap <silent> <leader>af :ALEFix<CR>


" ============================================================
" 22. RUST
" ============================================================

let g:rustfmt_autosave = 1


" ============================================================
" 23. PYTHON
" ============================================================

let g:python_highlight_all = 1


" ============================================================
" 24. TAGBAR
" ============================================================

let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0

nnoremap <silent> <leader>t :TagbarToggle<CR>


" ============================================================
" 25. GIT - FUGITIVE
" ============================================================

nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gl :Git log<CR>


" ============================================================
" 26. TERMINAL
" ============================================================

if exists(':terminal')

  nnoremap <silent> <leader>tt
        \ :botright split term://$SHELL<CR>

  nnoremap <silent> <leader>tv
        \ :botright vsplit term://$SHELL<CR>

  tnoremap <Esc> <C-\><C-n>

  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

endif


" ============================================================
" 27. WINDOW NAVIGATION
" ============================================================

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" ============================================================
" 28. WINDOW MANAGEMENT
" ============================================================

nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wq :close<CR>


" ============================================================
" 29. BUFFER MANAGEMENT
" ============================================================

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>


" Safe delete-all-buffers
function! CloseAllBuffers() abort
  let l:current = bufnr('%')
  let l:buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')

  for l:buf in l:buffers
    if l:buf != l:current
      execute 'silent! bdelete ' . l:buf
    endif
  endfor
endfunction

nnoremap <silent> <leader>ba :call CloseAllBuffers()<CR>


" ============================================================
" 30. SEARCH
" ============================================================

nnoremap <silent> <leader>nh :nohlsearch<CR>

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz


" ============================================================
" 31. VISUAL INDENTATION
" ============================================================

vnoremap < <gv
vnoremap > >gv


" ============================================================
" 32. SAVE
" ============================================================

nnoremap <leader>w :update<CR>


" ============================================================
" 33. BUILD / QUICKFIX
" ============================================================

nnoremap <silent> <leader>mb :make<CR>

nnoremap <silent> <leader>mn :cnext<CR>
nnoremap <silent> <leader>mp :cprevious<CR>

nnoremap <silent> <leader>mq :copen<CR>

nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cc :cclose<CR>


" ============================================================
" 34. RUST COMMANDS
" ============================================================

if exists(':terminal')

  command! CargoBuild terminal cargo build
  command! CargoRun terminal cargo run
  command! CargoTest terminal cargo test

  nnoremap <silent> <leader>rb :CargoBuild<CR>
  nnoremap <silent> <leader>rr :CargoRun<CR>
  nnoremap <silent> <leader>rt :CargoTest<CR>

endif


" ============================================================
" 35. EMMET
" ============================================================

let g:user_emmet_leader_key = '<C-Z>'
let g:user_emmet_install_global = 0

autocmd FileType html,css,scss EmmetInstall


" ============================================================
" 36. DEVICONS
" ============================================================

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1


" ============================================================
" 37. VIMSPECTOR
" ============================================================

if exists('*vimspector#Launch')

  let g:vimspector_enable_mappings = 'HUMAN'

  nnoremap <silent> <leader>ds
        \ :call vimspector#Launch()<CR>

  nnoremap <silent> <leader>dc
        \ <Plug>VimspectorContinue

  nnoremap <silent> <leader>db
        \ <Plug>VimspectorToggleBreakpoint

  nnoremap <silent> <leader>do
        \ <Plug>VimspectorStepOver

  nnoremap <silent> <leader>di
        \ <Plug>VimspectorStepInto

  nnoremap <silent> <leader>du
        \ <Plug>VimspectorStepOut

  nnoremap <silent> <leader>dr
        \ <Plug>VimspectorRestart

  nnoremap <silent> <leader>dq
        \ <Plug>VimspectorReset

endif


" ============================================================
" 38. LANGUAGE-SPECIFIC INDENTATION
" ============================================================

augroup LanguageSettings
  autocmd!

  autocmd FileType c,cpp,rust
        \ setlocal shiftwidth=4
        \ tabstop=4
        \ softtabstop=4
        \ expandtab

  autocmd FileType python
        \ setlocal shiftwidth=4
        \ tabstop=4
        \ softtabstop=4
        \ expandtab

  autocmd FileType javascript,typescript,json
        \ setlocal shiftwidth=2
        \ tabstop=2
        \ softtabstop=2
        \ expandtab

  autocmd FileType html,css,scss
        \ setlocal shiftwidth=2
        \ tabstop=2
        \ softtabstop=2
        \ expandtab

augroup END


" ============================================================
" 39. SPELLING
" ============================================================

nnoremap <leader>ss :setlocal spell!<CR>


" ============================================================
" 40. FILE ENCODING
" ============================================================

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,latin1


" ============================================================
" 41. PERFORMANCE
" ============================================================

set lazyredraw


" ============================================================
" 42. FINAL CHECK
" ============================================================

" Run:
"
"   :PlugInstall
"   :PlugUpdate
"   :PlugClean
"
" Useful diagnostics:
"
"   :CocInfo
"   :ALEInfo
"   :scriptnames
"
" ============================================================

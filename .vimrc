
set nocompatible
syntax enable
filetype plugin on

set path+=**
set wildmenu
set wildmode=longest,list,full

filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set numberwidth=4
set showmatch
set showcmd
set nocursorline
set lazyredraw

set ignorecase
set incsearch
set hlsearch

set foldmethod=indent
set foldnestmax=10
set foldenable
nnoremap <space> za
set foldlevelstart=10

"set listchars=tab:→\ ,space:·,trail:·
"highlight SpecialKey ctermfg=4 guifg=#ffffff

set number
set relativenumber
"let statuscolumn="%s %l %r "
set clipboard=unnamedplus
set paste
set scrolloff=8
set mouse=a
set autoindent
set cindent
set smartindent
set colorcolumn=80

autocmd BufReadPost, BufNewFile * normal! zz
autocmd BufWinEnter * normal! zz
nnoremap j jzzzv
nnoremap k kzzzv
xnoremap p "_dP
inoremap jk <Esc>
inoremap kj <Esc>
set timeoutlen=300
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"



let g:netrw_liststyle=3
let g:netrw_banner = 0

" Detect if inside tmux (or screen-like)
if exists('$TMUX') || &term =~# '^screen'
    set t_Co=256
	set notermguicolors   " Disable true color to prevent glitches
else
    set termguicolors     " Keep it outside tmux if you want RGB there
endif

" Fix background redraw (common tmux need)
set t_ut=

" Your colorscheme load (must come after the above)
syntax enable
set background=dark   " or light
"colorscheme molokai   " e.g. gruvbox, molokai, etc.


" Tell Vim how to send true color (RGB) sequences
"if &term =~# '^screen' || &term =~# '^tmux'
"    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"    let &t_8b = "\<Esc>[48;2;%lu;%lum"
"endif

" Terminal colors
set termguicolors

hi! LineNr guifg=#514e54 guibg=NONE
hi! Cursor guifg=#ffffff guibg=#a8351b
hi! CursorLineNr guifg=#a8351b guibg=NONE
hi! CursorLine guifg=#ffffff guibg=NONE
hi! VertSplit guifg=#ffffff guibg=NONE
hi! StatusLine guifg=#ffffff guibg=NONE
hi! StatusLineNC guifg=#ffffff guibg=NONE
hi! ColorColumn guifg=NONE guibg=#312e34
highlight ColorColumn ctermbg=236 guibg=#303030
hi! Visual guifg=NONE guibg=#455040
hi! Search guifg=NONE guibg=#404040
hi! IncSearch guifg=#ffffff guibg=NONE
hi! Pmenu guifg=#ffffff guibg=NONE
hi! PmenuSel guifg=#ffffff guibg=NONE
hi! SpecialKey guifg=#39363d guibg=NONE
hi! NonText guifg=#000000 guibg=NONE

hi! Comment guifg=#606060 guibg=NONE
hi! Constant guifg=#b1d404 guibg=NONE
hi! Identifier guifg=#7d69bf guibg=NONE
hi! Statement guifg=#97ff78 guibg=NONE
hi! PreProc guifg=#849470 guibg=NONE
hi! Type guifg=#849470 guibg=NONE
hi! Special guifg=#ffffff guibg=NONE
hi! Todo guifg=#ff0f00 guibg=#202020

if !exists('g:vimrc_reloaded')
    let g:vimrc_reloaded = 1
    autocmd VimEnter * call timer_start(35, {-> execute('source ~/.vimrc')}) | autocmd! VimEnter
endif


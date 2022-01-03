"Disable compatibility with vi which can cause unexpected issue
set nocompatible

"Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

"Enable plugins and load plugin for the detected file type.
filetype plugin on

"Load an indent file for the detected file type.
filetype indent on

"Turna syntas highlightin on.
syntax on

"Add numbers to each line on the left-hand side.
set number

"Set shift width to 4 spaces.
set shiftwidth=4

"Set tab width to 4 columns.
set tabstop=4

"Use space characters instead of tabs.
set expandtab

"Do not save backup files.
set nobackup

"Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

"Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

"While searching though a file incrementally highlight matching characters as you type.
set incsearch

"Ignore capital letters during search.
set ignorecase

"Override the ignorecase option if searching for capital letters.
"This will allow you to search specifically for capital letters.
set smartcase

"Show partial command you type in the last line of the screen.
set showcmd

"Show the mode you are on the last line.
set noshowmode

"Show matching words during a search.
set showmatch

"Use highlighting when doing a search.
set hlsearch

"Set the commands to save in history. Default number is 20.
set history=1000

"Enable auto completion menu after pressing TAB.
set wildmenu

"Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

"There are certain files that we would never want to edit with Vim.
"Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Set Vim colors
set t_Co=16

  "-------------------- PLUGINS -------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'

call plug#end()

"NERDTree settings
"Start NERDTree when Vim is opened and leave the cursor in it
autocmd VimEnter * NERDTree

"Start NERDTree when Vim is opened and put the cursor back in the other window
autocmd VimEnter * NERDTree | wincmd p

"Open the exisitng NerdTree on each new tab
autocmd BufWinEnter * silent NERDTreeMirror

"Exit Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
  "}}}

"-------------------- MAPPINGS -------------------- {{{



"}}}

"-------------------- VIMSCRIPTS -------------------- {{{

"This will enable code folding.
"Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"Press the space bar to type the : character in command mode
nnoremap <space> :

"NERDTree specifing mappings
"Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

"Have NERDTree ignore certain files and directories
let NERDTreeIgnore=['\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

"}}}

"-------------------- STATUS LINE -------------------- {{{

"Clear status line when vimrc is reloaded.
set statusline=

"Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

"Use a divider to separate the left side from the right side.
set statusline+=%=

"Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

"Show the status on the second to last line.
set laststatus=2

"Syntastic statusline settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"Statusline colorscheme settings
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
" }}}

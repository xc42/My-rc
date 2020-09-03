
set encoding=utf-8
let mapleader = ","
nnoremap 0 ^
nnoremap ^ 0
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
nnoremap <Tab> <C-w>w
vnoremap d "_d

nnoremap <leader>d d
nnoremap <leader>D D
vnoremap <leader>d ""d

set nu
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set foldmethod=syntax
set nofoldenable


call plug#begin('~/.local/share/nvim/site/autoload/plugged')

Plug 'tomasr/molokai'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

syntax on
colorscheme molokai
"""""""""""""""	Coc.nvim """""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
"
" " Give more space for displaying messages.
set cmdheight=2
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"""""""""""""""	Coc.nvim """""""""""""""""""""""

let g:airline#extensions#coc#enabled = 1


""""""""""""""" Vista """""""""""""""""""""""
function! NearestMethodOrFunction() abort
	  return get(b:, 'vista_nearest_method_or_function', '')
  endfunction

set statusline+=%{NearestMethodOrFunction()}
  
""""""""""""""" Vista """""""""""""""""""""""

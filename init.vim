
set encoding=utf-8
let mapleader = ","
nnoremap 0 ^
nnoremap ^ 0
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d d
nnoremap <leader>D D
vnoremap <leader>d ""d
tnoremap <C-n> <C-\><C-n>

set nu
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set foldmethod=syntax
set nofoldenable
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

call plug#begin('~/.local/share/nvim/site/autoload/plugged')

Plug 'tomasr/molokai'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'phanviet/vim-monokai-pro'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'rhysd/git-messenger.vim'

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
nmap <silent> [g <Plug>(coc-diagnost1ic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nn <silent> <leader>b :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> <leader>B :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
"nn <silent> <leader>d :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
"nn <silent> <leader>D :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> <leader>c :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> <leader>C :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

nn <silent> <C-H>  :call CocAction('doHover')<cr>
"nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
"nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
"nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
"nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>


"""""""""""""""	airline """""""""""""""""""""""
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#whitespace#enabled = 0
"""""""""""""""	airline """""""""""""""""""""""

"""""""""""""""	Coc.nvim """""""""""""""""""""""
let g:airline#extensions#coc#enabled = 1


""""""""""""""" Vista """""""""""""""""""""""
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 0

function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}

nn	<leader>v	:Vista coc<CR>
""""""""""""""" Vista """""""""""""""""""""""

"""""""""""""""" fzf """"""""""""""""""""""""
noremap <C-J> :Files<CR>
noremap <C-K> :Ag<CR>
noremap <C-L> :BLines<CR>
"""""""""""""""" fzf """"""""""""""""""""""""

"""""""""""""""" APZelos/blamer.nvim """""""""""""""""""""""
nnoremap <leader>gb		:BlamerToggle<CR>
let g:blamer_date_format = '%Y/%m/%d %H:%M'
"""""""""""""""" APZelos/blamer.nvim """""""""""""""""""""""

"""""""""""""""" rhysd/git-messenger.vim """""""""""""""""""""""
nn <leader>gm <Plug>(git-messenger)
let g:git_messenger_date_format = "%Y %b %d %X"
"""""""""""""""" rhysd/git-messenger.vim """""""""""""""""""""""

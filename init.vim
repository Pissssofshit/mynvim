call plug#begin('~/.vim/plugged')

" < Other Plugins, if they exist >

Plug 'fatih/vim-go'
"Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'

"Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
" 主题配色
"Plug 'rakr/vim-one'
"Plug 'altercation/vim-colors-solarized'
"Plug 'ashfinal/vim-colors-violet'
"Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'

"Plug 'gu-fan/lastbuf.vim'
Plug 'uarun/vim-protobuf' 

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set scrolloff=30
"vimgo
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
set ignorecase
"let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

"let g:molokai_original = 1
"syntax enable
"set background=dark
"let g:solarized_termcolors = 256  " New line!!
"colorscheme solarized


 "let g:solarized_termcolors=256
"colorscheme base16-default-dark


"let g:solarized_termcolors = 256  " New line!!
syntax on
colorscheme onedark

" theme
"colorscheme one
"set background=dark " for the dark version

let mapleader=" "
"map <leader>r :GoReferrers<cr>
map <c-j> :GoDef<cr>
set nu
map <leader><leader>t :GoAlternate<CR>
map <leader>l :CocList<CR>

imap {<CR> {<CR>}<ESC>O

let g:go_rename_command = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

nmap <c-f> :CocList -A mru <CR>
nmap <c-e> :CocList <CR>
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nmap <space>e :CocCommand explorer<CR>

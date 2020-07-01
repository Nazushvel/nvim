if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif
call plug#begin()
Plug 'lambdalisue/suda.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
call plug#end()
" appearance
set background=dark
set cursorline
set noshowmode
" format
set number
set shiftwidth=4
set softtabstop=4
" keybindings
let mapleader = ","
map <leader>n :set invnumber<CR>
" fixes
command! W :w suda://%
au BufEnter * set noro " disable readonly warning
" plugins
colorscheme gruvbox
let g:airline_theme='term'

"" Disable Ultisnips keybindings 
let g:UltiSnipsExpandTrigger = "<NUL>"

"" Coc Config

" global install
let g:coc_global_extensions=[ 'coc-powershell', 'coc-snippets', 'coc-python', 'coc-pairs', 'coc-explorer' ]

" key bindings mainly tab control

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" main coc data location
let g:coc_data_home = '~/.config/nvim/coc'

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

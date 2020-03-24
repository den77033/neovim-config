" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'mxw/vim-jsx'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim' 
"Linter support
Plug 'w0rp/ale'

"colorschemes
Plug 'morhetz/gruvbox'

call plug#end()

set number
set expandtab
set tabstop=2
:set mouse=a
syntax on
colorscheme gruvbox
set background=dark

set hlsearch
set incsearch

let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \  }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

"mappings
map <C-n> :NERDTreeToggle<CR>

"FORMATTERS
"au FileType javascript setlocal formatprg=prettier
"au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ }

"Enable deoplete at startup

let g:deoplete#enable_at_startup = 1

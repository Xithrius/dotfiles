set updatetime=200
set number
set linebreak
set showmatch
set visualbell
set splitright
set splitbelow

syntax on
set termguicolors

set scrolloff=1
set sidescrolloff=1
set hlsearch
set smartcase
set ignorecase
set incsearch
set softtabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set ruler
set lazyredraw
set nomodeline
set smarttab
set autoindent
set smartindent

colorscheme material

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua require('init')
lua require('lsp')


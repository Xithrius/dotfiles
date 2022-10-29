set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" https://github.com/junegunn/vim-plug
" Plugin Installation through Vim-Plug
call plug#begin('~/.vim/plugged')

" https://github.com/farmergreg/vim-lastplace
" vim-lastplace Reopen files at the last edit position.
Plug 'farmergreg/vim-lastplace'

" https://github.com/machakann/vim-sandwich
Plug 'machakann/vim-sandwich'

" https://github.com/tpope/vim-repeat
" enable repeatin gsupported plugin maps with "."
Plug 'tpope/vim-repeat'

" https://github.com/ervandew/supertab
" Use <Tab> for all insert completions.
Plug 'ervandew/supertab'

" https://github.com/mhinz/vim-startify
" A fancy start screen.
Plug 'mhinz/vim-startify'

" https://github.com/vim-airline/vim-airline
" A status / tabline that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/junegunn/fzf.vim
Plug '/usr/local/opt/fzf', { 'on': 'Files' }
Plug 'junegunn/fzf.vim', { 'on': 'Files' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" https://github.com/scrooloose/nerdtree
" File system explorer plugin
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" https://github.com/Xuyuanp/nerdtree-git-plugin
" Shows Git file status in NERD Tree
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" https://github.com/airblade/vim-gitgutter
" Shows Git line status in the sign column (gutter)
Plug 'airblade/vim-gitgutter'

" https://github.com/majutsushi/tagbar
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" https://github.com/olimorris/onedarkpro.nvim
Plug 'olimorris/onedarkpro.nvim'

Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

call plug#end()

"   - Plugin Configuration -
"       deoplete
"           Use deoplete at startup.
let g:deoplete#enable_at_startup = 1

"           Show a maximum of 10 autocompletion suggestions.
let g:deoplete#max_list = 10

"       SuperTab
"           Navigate the completion menu from top to bottom.
let g:SuperTabDefaultCompletionType = "<c-n>"

"       vim-markdown
"           Disable folding.
let g:vim_markdown_folding_disabled = 1

"           Use TeX syntax extension.
let g:vim_markdown_math = 1

" Use Powerline Fonts
let g:airline_powerline_fonts = 1

" Diplay buffers in tabline when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Enable Bufferline integration
let g:airline#extensions#bufferline#enabled = 1

"       NERDTree
"           Ignore pycache files and folder.
let NERDTreeIgnore = ['\.pyc$', '__pycache__$']

"   - Vim Color Configuration -
"       From:          https://www.reddit.com/r/unixporn/comments/5vke7s/osx_iterm2_tmux_vim/
"       Screenshots:   http://imgur.com/a/6OIdz
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

"       Colorscheme Configuration
" let g:gruvbox_italics = 1
set background=dark
colorscheme onedarkpro 
let g:airline_theme='base16_google_dark'

let mapleader="\<Space>"
let maplocalleader="\\"
nnoremap <Space> <nop>

"   - Keymaps -
" Toggle NERD Tree with CTRL-N
map <C-n> :NERDTreeToggle<CR>
" Toggle Git Status with CTRL-G
map <C-g> :Gstatus<CR>
" Toggle fzf with CTRL-F
map <C-f> :Files<CR>
" Toggle Tagbar with CTRL-T
map <C-t> :TagbarToggle<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"   - Vim Editing Configuration -
"       Copy indent from the current line on inserting an newline
set autoindent

"       Make Tab insert spaces
set expandtab

"       Insert 4 spaces for a Tab
set tabstop=4

"       Use 4 space characters for indentation
set shiftwidth=4

"       Overrides 'ignorecase' if the pattern contains uppercase characters.
set smartcase

"       Show the line numbers
set number

"       Do not show the default mode text (e.g. -- INSERT --)
set noshowmode

"       Don't preview documentation for completion
set completeopt-=preview

"       Find search matches incrementally
set incsearch

"       Do not change the cursor to '|' in insert mode.
set guicursor=

"       Use syntax concealing.
set conceallevel=2

"     Exit Terminal Mode with CTRL-k
tnoremap <C-k> <C-\><C-n>

" Persistent undo history
set undodir=/tmp/vim_undo
set undofile

" Fix weird Shift-Space interaction
imap <S-Space> <Space>

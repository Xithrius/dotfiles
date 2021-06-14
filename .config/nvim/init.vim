call plug#begin('~/.local/share/nvim/plugged')


" +---------+
" |  Looks  |
" +---------+
" Fancy status stuff
Plug 'vim-airline/vim-airline'
" https://github.com/sainnhe/gruvbox-material
Plug '~/.config/nvim/themes/gruvbox-material'


" +--------------+
" |  Navigation  |
" +--------------+
" Start screen
Plug 'mhinz/vim-startify'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
" Smooth scrolling
Plug 'karb94/neoscroll.nvim'


" +-------+
" |  LSP  |
" +-------+
" Neovim LSP
Plug 'neovim/nvim-lspconfig'
" LSP completion
Plug 'hrsh7th/nvim-compe'
" LSP status
Plug 'nvim-lua/lsp-status.nvim'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" Lightbulb
Plug 'kosayoda/nvim-lightbulb'


" +-------+
" |  Git  |
" +-------+
" Commit messages
Plug 'rhysd/committia.vim'
" Git messenger
Plug 'rhysd/git-messenger.vim'
" Git signs
Plug 'lewis6991/gitsigns.nvim'


call plug#end()


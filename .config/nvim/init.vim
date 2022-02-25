call plug#begin('~/.local/share/nvim/plugged')


" +---------+
" |  Looks  |
" +---------+
" Fancy status stuff
Plug 'rbong/vim-crystalline'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }


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
" Viewing code from a distance
Plug 'nacro90/numb.nvim'


" +---------------+
" |  General LSP  |
" +---------------+
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
" Enwise (auto-tabbing)
Plug 'mapkts/enwise'
" Sandwich
Plug 'machakann/vim-sandwich'
" Comments
Plug 'tpope/vim-commentary'
" Fish syntax highlighting and stuff
Plug 'dag/vim-fish'


" +------------+
" |  Rust LSP  |
" +------------+
" Very cool Rust stuff
Plug 'simrat39/rust-tools.nvim'
" Debugging 
Plug 'mfussenegger/nvim-dap'


" +-------+
" |  Git  |
" +-------+
" Commit messages
Plug 'rhysd/committia.vim'
" Git messenger
Plug 'rhysd/git-messenger.vim'
" Git signs
Plug 'lewis6991/gitsigns.nvim'
" Opening Git repositories in their respective remote repository
Plug 'nvim-lua/plenary.nvim'
Plug 'ruifm/gitlinker.nvim'


call plug#end()


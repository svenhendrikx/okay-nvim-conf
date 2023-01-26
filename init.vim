
set nocompatible
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" set rootdir to git root
autocmd VimEnter * Gcd

" set leader to spacebar
let mapleader = " "

" enable syntax and plugins
syntax enable
filetype plugin on

" Finding Files
set path+=**
set wildmenu
set number relativenumber

" command to generate ctags
command! MakeTags !ctags -R .

" netrw settings
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_list_hide=netrw_gitignore#Hide()

" For touchbar macs
inoremap § <esc>
" Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <c-a> :NERDTreeToggle<cr>
nnoremap <cr> :nohl<cr>


command Uhmm :!more ~/vim_commands
command Sorc :so ~/.config/nvim/init.vim
command Rc :find ~/.config/nvim/init.vim

set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

call plug#end()


lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  hightlight = { enable = true },
  indent = { enable = true }
}
EOF
lua <<EOF
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()
EOF




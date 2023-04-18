
set nocompatible
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" set rootdir to git root
autocmd VimEnter * Gcd
command! Mi MagmaInit

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
command! So source ~/.config/nvim/init.vim

" netrw settings
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_list_hide=netrw_gitignore#Hide()

" For touchbar macs
inoremap § <esc>

" tagbar
nnoremap <c-s> :TagbarToggle<CR><c-w>l
" Git gud
nnoremap <leader>gs <cmd>Gvdiffsplit<cr>


" Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope find_files hidden=true<cr>

" Magma remaps
nnoremap <silent>       <leader>rr :MagmaEvaluateLine<CR>
nnoremap <silent>       <leader>rc :lua close_float()<CR>
xnoremap <silent>       <leader>r  :<C-u>MagmaEvaluateVisual<CR>

" Python breakpoint
nnoremap <silent>       <leader>bp obreakpoint()<esc>
nnoremap <silent>       <leader>bi oimport code; code.interact(local=locals())<esc>

" Nerdtree
nnoremap <c-a> :NERDTreeToggle<cr>
" nnoremap <cr> :nohl<cr>


command Uhmm :!more ~/vim_commands
command Sorc :so ~/.config/nvim/init.vim
command Rc :find ~/.config/nvim/init.vim

set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
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
Plug 'tpope/vim-surround'
Plug 'ellisonleao/glow.nvim'
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

function close_float()
	-- removes any stuck floating window
    if table.getn(vim.api.nvim_list_wins()) > 1 then
        print('letsfuckoingog')
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            print(win)
--             local config = vim.api.nvim_win_get_config(win)
-- if config.relative ~= "" then
--                 vim.api.nvim_win_close(win, false)
--                 print("Closing window", win)
--             end
        end
    end
end

require('glow').setup({
  border = "shadow", -- floating window border config
  style = "dark", -- filled automatically with your current editor background, you can override using glow json style
  width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  height_ratio = 0.9,
})
EOF



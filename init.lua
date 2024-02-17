require("local.set")
require("local.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    "robitx/gp.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "rose-pine/neovim", name = "rose-pine" },
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
	'mbbill/undotree',
    'm4xshen/autoclose.nvim',
	'preservim/tagbar',

	'vim-airline/vim-airline',
	'vim-airline/vim-airline-themes',
	'tpope/vim-surround',
    "lukas-reineke/indent-blankline.nvim",
    {"ray-x/lsp_signature.nvim"},
--    { "folke/neoconf.nvim", cmd = "Neoconf" },
--    "folke/neodev.nvim",
})

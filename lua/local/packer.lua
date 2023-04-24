vim.cmd [[packadd packer.nvim]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require('packer').startup(function(use)
	-- Packer can manage itself

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	}
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { 'rose-pine/neovim', as = 'rose-pine' }
	vim.cmd('colorscheme rose-pine')

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

    use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}
    use "lukas-reineke/indent-blankline.nvim"
    use 'm4xshen/autoclose.nvim'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'preservim/tagbar' 
	use 'tpope/vim-commentary' 
	use 'vim-airline/vim-airline' 
	use 'vim-airline/vim-airline-themes' 
	use 'tpope/vim-surround' 

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}



end)

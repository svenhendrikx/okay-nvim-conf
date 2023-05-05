vim.g.mapleader = " "

-- For touchbar macs
vim.keymap.set("i", "§", "<esc>")

-- Mason
vim.keymap.set("n", "<leader>gl", "<cmd>Glow<cr>" )

-- Python breakpoint
vim.keymap.set("n", "<leader>bp", "obreakpoint()<esc>" )
vim.keymap.set("n", "<leader>bi", "oimport code; code.interact(local=locals())<esc>" )

-- Show help
vim.keymap.set("n", "<leader>hmm", ":Glow ~/.config/nvim/README.md<cr>" )

vim.api.nvim_create_autocmd(
    "VimEnter",
    { command = [[ Gcd ]] }
)

-- vim.api.nvim_create_autocmd(
--     "VimEnter",
--     { command = [[ silent !ctags -R ]] }
-- )

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")


-- Plug 'L3MON4D3/LuaSnip'             " Required
-- Plug 'rafamadriz/friendly-snippets' " Optional

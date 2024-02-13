vim.g.mapleader = " "

-- For touchbar macs
vim.keymap.set("i", "§", "<esc>")

-- Python breakpoint
vim.keymap.set("n", "<leader>bp", "oimport ipdb; ipdb.set_trace()<esc>" )
vim.keymap.set("n", "<leader>bi", "ofrom IPython import embed; embed()<esc>" )

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

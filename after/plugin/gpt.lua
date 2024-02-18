require("gp").setup()
vim.keymap.set("v", "<leader>gi", ":<C-u>'<,'>GpImplement<cr>")
vim.keymap.set("v", "<leader>gr", ":<C-u>'<,'>GpRewrite<cr>")

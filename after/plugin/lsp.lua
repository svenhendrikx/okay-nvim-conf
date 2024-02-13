local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
function setlevelerr()
    vim.diagnostic.config({
        virtual_text ={
            severity = vim.diagnostic.severity.ERROR
        },
    })
end

function setlevelwarn()
    vim.diagnostic.config({
        virtual_text ={
            severity = vim.diagnostic.severity.WARNING
        },
    })
end
setlevelerr()
local level = 'err'
function togglelevel()
    if level == 'warn' then
        setlevelerr()
        level = 'err'
    else
        setlevelwarn()
        level = 'warn'
    end
end

vim.keymap.set("n", "<leader>ma", "<cmd>Mason<cr>" )
vim.keymap.set("n", "<leader>wa", togglelevel)

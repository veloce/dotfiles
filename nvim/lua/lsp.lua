local map = vim.keymap.set

-- prevent gutter flicker on error
vim.opt.signcolumn = "yes"

-- map("n", "C-]",  vim.lsp.buf.definition)
map("n", "gd",  vim.lsp.buf.definition)
map("n", "K",  vim.lsp.buf.hover)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gD", vim.lsp.buf.document_symbol)
map("n", "gW", vim.lsp.buf.workspace_symbol)
map("n", "<leader>cl", vim.lsp.codelens.run)
map("n", "<leader>sh", vim.lsp.buf.signature_help)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<space>q", vim.diagnostic.setqflist)

map("n", "[c", vim.diagnostic.goto_prev)
map("n", "]c", vim.diagnostic.goto_next)

-- must pass then the on_attach function to each lsp config that should format
require("lsp-format").setup {}

require('lspconfig').tsserver.setup {}

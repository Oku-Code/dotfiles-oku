-- Nvim LPS

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufrn)
 -- Format on save
 if client.server_capabilities.documentFormattingProvider then
  vim.api.nvim_create_autocmd("BufWritePre", {
   vim.api.nvim_create_augroup("Format", { clear = true}),
   buffer = bufrn,
   callback = function() vim.lsp.buf.formatting_seq_sync() end
  })
 end
end

-- Typescript

nvim_lsp.tsserver.setup {
 on_attach = on_attach,
 filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
 cmd = { "typescript-language-server", "--stdio" }
}

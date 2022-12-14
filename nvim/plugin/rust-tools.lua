-- LSP

local rt = require('rust-tools')

rt.setup({
 server = {
       on_attach = function(_, bufnr)
        -- Hover Action
       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
       -- code action groups
       vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy"
        },
      },
    },
})

local sign = function(opts)
 vim.fn.sign_define(opts.name, {
   texthl = opts.name,
   text = opts.text,
   numhl = ''
 })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = ''
  },
})

vim.cmd([[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false})
]])



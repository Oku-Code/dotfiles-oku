-- Treesitter

local status, ts = pcall(require, "nvim-tressitter.configs")
if (not status) then return end

require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "rust", "toml", "tsx", "fish", "css", "html", "json" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'rust', 'javascript', 'typescript', 'css', 'toml', 'json', "tsx", "jsx"}
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }, 
  autotag = {
    enable = true,
  }
})

local parser_config = require "nvim-tressiter.parsers".get_parser_config()
parser_config.tsx.filetype_to_parsername = { "javascript.jsx", "typescript.tsx" }

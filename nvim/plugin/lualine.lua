-- Lualine config

local status, lualine = pcall(require, 'lualine')
if(not status) then return end

lualine.setup {
 options = {
  icons_enabled = true,
  theme = 'onedark',
  disabled_filetypes = {},
  section_separators = { left = '', right = '' },
  component_separators = { left = '', right = '' },
 },
 section = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch' },
  lualine_c = {{ file_status = true, path = 0, 'filename'}},
  lualine_x = {{ 'diagnostics', sources = { 'nvim-diagnostics' }, symbols = { error = ' ', warn = ' ', info = ' ',
        hint = ' '}, 'encoding', 'filetype'}},
  lualine_y = { 'progress' },
  lualine_z = { 'location' }
 },
 inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {{ 'filename', file_status = true, path = 1 }},
  lualine_x = { 'location' },
  lualine_y = {},
  lualine_z = {},
 }, 
 tabline = {},
 extensions = { 'fugitive' } 
}

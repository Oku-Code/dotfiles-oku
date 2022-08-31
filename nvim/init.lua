-- Neovim Lua config

require('settings')
require('plugins')
require('keybinds')
require('opts')

-- Lua Table

function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end


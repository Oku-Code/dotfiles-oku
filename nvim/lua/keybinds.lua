-- Keybindings for my config

local function map(m, k, v)
 vim.keymap.set(m, k, v, { silent=true })
end

-- Neovim Basic Bindings

--[[map('n', '<C-q>', '<CMD>q<CR>')
map('n', '<C-s>', '<CMD>w<CR>')
map('n', '<C-x>', '<CMD>q!<CR>')
]]

-- NvimTree Toggle

map('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')

-- Vimspector

vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
map('n', "Dw", ":call vimspector#AddWatch()<cr>")
map('n', "De", ":call vimspector#Evaluate()<cr>")

-- Floaterm

map('n', "<leader>t", ":FloatermNew --name=Terminal --height=0.8 --width=0.7 --autoclose=2 fish <CR>")
map('n', "t", ":FloatermToggle Terminal<CR>")
map('n', "<Esc>", "<C-\\><C-n>:q<CR>")


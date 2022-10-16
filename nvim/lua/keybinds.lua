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

-- Floaterm

map('n', "<leader>t", ":FloatermNew --name=Terminal --height=0.8 --width=0.7 --autoclose=2 fish <CR>")
map('n', "t", ":FloatermToggle Terminal<CR>")
map('n', "<Esc>", "<C-\\><C-n>:q<CR>")

-- Telescope

map('n', '<leader>sl', '<CMD>SessionLoad<CR>')

-- Keybindings Telescope

map('n', '<leader>fr', '<CMD>Telescope oldfiles<CR>')
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope file_browser<CR>')
map('n', '<leader>fw', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>ht', '<CMD>Telescope colorscheme<CR>')

-- Keybindings bufferline

map('n', '<Tab>', '<CMD>BufferlineCycleNext<CR>')
map('n', '<S-Tab>', '<CMD>BufferlineCyclePrev<CR>')

-- Keybindings LSPSaga

map('n', 'K', '<CMD>Lspsaga hover_doc<CR>')
map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
map('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>')
map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
map('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>')
map('n', 'gr', '<Cmd>Lspsaga rename<CR>')


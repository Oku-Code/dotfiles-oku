-- Plugin Configuration

-------------------
-- Packer Config --
-------------------

-- Install Packer Automatically

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.vim"

-- For diagnostics

if fn.empty(fn.glob(install_path)) > 0 then
 PACKER_BOOTSTRAP = fn.system {
  "git",
  "clone",
  "--depth",
  "1",
  "https://gitlab.com/wbthomason/packer.nvim",
  install_path
 }

 vim.cmd[[packadd packer.nvim]]
end

-- Reload neovim when plugins.lua file has changes

vim.api.nvim_create_autocmd('BufWritePost', {
 group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
 pattern = 'packer-plugins.lua',
 command = 'source <afile> | PackerCompile'
})

--Use protected call

local status_ok, packer = pcall(require, "packer")
if not status_ok then
 return 
end

-- Popup Window

packer.init {
 snapshot_path = fn.stdpath "config" .. "/snapshots",
 max_jobs = 50,
 display = {
   open_fn = function()
    return require("packer.util").float { border = "rounded" }
   end, 
   prompt_border = 'rounded',
 },
}

--------------------
-- Packer Plugins --
--------------------

return require('packer').startup({
	function(use)
        -- Packer Manage himself
		use('wbthomason/packer.nvim')

        -- Color Schemes
		use('gruvbox-community/gruvbox')
        use('rebelot/kanagawa.nvim')
        use('navarasu/onedark.nvim')

        -- Lua Line
        use(
          {'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
          }
        )
        
        -- Nvim-tree
        use('kyazdani42/nvim-tree.lua')
        --[[use(
         {'nvim-neo-tree/neo-tree.nvim',
           requires = {
                    "nvim-lua/plenary.nvim",
                    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
                    "MunifTanjim/nui.nvim",}
         }
         )]]

        ---------
        -- LSP --
        ---------
        use({
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
          'neovim/nvim-lspconfig'
        })
        
        use('jose-elias-alvarez/null-ls.nvim')

        -------------------
        -- Rust Specifics -
        -------------------
        
        use('simrat39/rust-tools.nvim')

        ----------------------------
        -- Completion and Snippets -
        ----------------------------

        -- Framework
        
        use('hrsh7th/nvim-cmp')

        --LPS Completion Source

        use('hrsh7th/cmp-nvim-lsp')

        -- Sources
        
        use('hrsh7th/cmp-nvim-lua')
        use('hrsh7th/cmp-nvim-lsp-signature-help')
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-path')
        use('hrsh7th/cmp-buffer')
        use('hrsh7th/vim-vsnip')

        -- Treesitter
        use('nvim-treesitter/nvim-treesitter')

        ----------------------------
        -- Debug and test in Rust --
        ----------------------------

        use('puremourning/vimspector')

        ---------------
        -- Terminal  --
        ---------------

        use('voldikss/vim-floaterm')

        ---------------------------------
        -- Fuzzy Finder and Telescope  --
        ---------------------------------

        use('nvim-telescope/telescope.nvim')
        use('nvim-telescope/telescope-file-browser.nvim')
        use('nvim-telescope/telescope-media-files.nvim')
        use('nvim-lua/plenary.nvim')

        -----------
        -- Tabs  --
        -----------

        use({
         'akinsho/bufferline.nvim',
         tag = "v2.*",
         requires = 'kyazdani42/nvim-web-devicons'
        })
        
	end
})

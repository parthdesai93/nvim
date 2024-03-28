-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Elixir tools
    --use {
    --    'elixir-tools/elixir-tools.nvim',
    --    tag = 'stable',
    --    requires = { 'nvim-lua/plenary.nvim'
    --}}
    -- Git
    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    } 
    -- NeoTree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim'
        } }
    }

    -- Theme
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'shaunsingh/nord.nvim' }
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- TreeSitter
    use({'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"})

    -- Undo
    use('mbbill/undotree')

    -- Vim-Test
    use('vim-test/vim-test')

    -- ZenMode
    use('folke/zen-mode.nvim')
end)

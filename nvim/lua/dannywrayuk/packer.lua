vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "lunarvim/darkplus.nvim"
    use {
        "nvim-treesitter/nvim-treesitter",
        run =  ":TSUpdate",
    }
    use "nvim-tree/nvim-web-devicons"
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }
    use "nvim-lualine/lualine.nvim"
    use "nvim-treesitter/playground"
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"L3MON4D3/LuaSnip"},
        }
    }
    use "ryanoasis/vim-devicons"
    use "tpope/vim-fugitive"
end)

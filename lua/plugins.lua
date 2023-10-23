local cmd = vim.cmd
local execute = vim.api.nvim_command
local fn = vim.fn

-- Bootstrapping
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    execute("packadd packer.nvim")
end

-- Start
cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- Load Plugins
return require("packer").startup(function(use)
    -- Themes
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = [[require('themes.catppuccin')]],
    })

    -- use {
    --   'dracula/vim',
    --   config = function()
    --     vim.cmd [[syntax on]]
    --     vim.cmd [[set t_Co=256]]
    --     -- vim.cmd [[set cursorline]]
    --     vim.cmd [[colorscheme dracula]]
    --   end,
    -- }

    -- use {
    --   'morhetz/gruvbox',
    --   config = function()
    --     vim.cmd [[syntax on]]
    --     vim.cmd [[set t_Co=256]]
    --     vim.cmd [[set cursorline]]
    --     vim.cmd [[colorscheme gruvbox]]
    --     vim.cmd [[set background=dark]]
    --   end,

    -- use {
    --   'kunzaatko/nord.nvim',
    --   config = function()
    --     vim.cmd [[colorscheme nord]]
    --   end,
    -- }

    -- use {
    --   'sonph/onehalf',
    --   rtp = 'vim',
    --   config = function()
    --     vim.cmd [[syntax on]]
    --     vim.cmd [[set t_Co=256]]
    --     vim.cmd [[set cursorline]]
    --     vim.cmd [[colorscheme onehalfdark]]

    -- use {
    --   'shaunsingh/nord.nvim',
    --   config = function()
    --     vim.g.nord_borders = true
    --
    --       require('nord').set()
    --   end,
    -- }

    -- Package manager
    use("wbthomason/packer.nvim")

    use("justinmk/vim-sneak")
    use("kyazdani42/nvim-web-devicons")
    use("neovim/nvim-lspconfig")
    use("sindrets/diffview.nvim")

    use({
        "chentoast/marks.nvim",
        config = [[require('marks').setup()]],
    })

    use({
        "akinsho/toggleterm.nvim",
        config = [[require('plugins.toggleterm')]],
    })

    use({
        "onsails/lspkind.nvim",
        config = [[require("lspkind").init()]],
    })

    use({
        "numToStr/Comment.nvim",
        config = [[require('plugins.comment')]],
    })

    use("nvim-lua/lsp-status.nvim")

    use({
        "mfussenegger/nvim-dap",
        config = [[require('plugins.nvim-dap')]],
    })

    use({
        "windwp/nvim-autopairs",
        config = [[require('nvim-autopairs').setup()]],
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = [[require('plugins.indent-blankline')]],
    })

    use({
        "theHamsta/nvim-dap-virtual-text",
        requires = {
            { "mfussenegger/nvim-dap" },
        },
        config = [[require('nvim-dap-virtual-text').setup()]],
    })

    use({
        "rcarriga/nvim-dap-ui",
        requires = {
            { "mfussenegger/nvim-dap" },
        },
        config = [[require('plugins.nvim-dap-ui')]],
    })

    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
        config = [[require('plugins.gitsigns-nvim')]],
    })

    use({
        "kristijanhusak/vim-dadbod-ui",
        requires = {
            { "tpope/vim-dadbod" },
            { "kristijanhusak/vim-dadbod-completion" },
        },
        config = [[require('plugins.vim-dadbod-ui')]],
    })

    use({
        "glepnir/dbsession.nvim",
        cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
        config = function()
            require("dbsession").setup({})
        end,
    })

    use({
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = [[require('plugins/dashboard-nvim')]],
    })

    use({
        "williamboman/mason-lspconfig.nvim",
        requires = {
            { "williamboman/mason.nvim" },
            { "b0o/schemastore.nvim" },
        },
        config = [[require('plugins.mason-lspconfig')]],
    })

    use({
        "nvimtools/none-ls.nvim",
        config = [[require('plugins.none-ls')]],
    })

    use({
        "akinsho/nvim-bufferline.lua",
        requires = {
            { "kyazdani42/nvim-web-devicons" },
        },
        config = [[require('plugins.nvim-bufferline')]],
    })

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lsp-document-symbol" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "kristijanhusak/vim-dadbod-completion" },
            { "quangnguyen30192/cmp-nvim-ultisnips" },
            { "windwp/nvim-autopairs" },
        },
        config = [[require('plugins.nvim-cmp')]],
    })

    use({
        "SirVer/ultisnips",
        requires = {
            { "honza/vim-snippets", rtp = "." },
        },
        config = function()
            vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
            vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
            vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
            vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
        end,
    })

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "kdheepak/lazygit.nvim" },
        },
        config = [[require('plugins.telescope')]],
    })

    use({
        "hoob3rt/lualine.nvim",
        requires = {
            { "kyazdani42/nvim-web-devicons" },
            { "nvim-lua/lsp-status.nvim" },
        },
        config = [[require('plugins.lualine')]],
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = [[require('plugins.nvim-treesitter')]],
    })

    use({
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        config = [[require('treesitter-context').setup()]],
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "kyazdani42/nvim-web-devicons" },
        },
        config = [[require('plugins.nvim-tree')]],
    })

    use({
        "rmagatti/auto-session",
        config = [[require('plugins.auto-session')]],
    })

    use({
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = [[require('plugins.nvim-ufo')]],
    })

    use({
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = [[require('plugins.todo-comments')]],
    })

    use({
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup()
        end,
    })

    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = [[require('plugins.chatgpt-nvim')]],
    })
end)
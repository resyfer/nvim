return {
    "neovim/nvim-lspconfig",
    cmd = "Mason",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function() require("config.lsp") end,
}
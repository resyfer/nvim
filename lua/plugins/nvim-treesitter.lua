return {
    "nvim-treesitter/nvim-treesitter",
    event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        
    }
}
return {
    "yorickpeterse/nvim-window",
    keys = {
      { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to window" },
    },
    config = true,
}
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 999999

vim.api.nvim_set_keymap('n', 'k', 'kzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'jzz', { noremap = true, silent = true })

require("config.lazy")
require("config.which-key")
require("config.persistence")
require("config.treesitter")
require("config.nvim-window")
require("config.bufferline")
require("config.lualine")
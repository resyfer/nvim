require("config.lazy")

vim.opt.termguicolors = true
require("bufferline").setup({})

require('lualine').setup()

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

require("mason-lspconfig").setup {
    automatic_enable = {
	    "actionlint",
	    "alex",
	    "ansible-lint",
	    "api-linter", -- Protobuf
	    "asm-lsp",
	    "ast-grep", -- Search in AST
	    "autoflake",
	    "autotools-language-server",
	    "bash-language-server",
	    "basics-language-server",
	    "beautysh",
	    "biome",
	    "checkstyle", -- Java style
	    "clang-format",
	    "clangd",
	    "cmakelang",
	    "cmakelint",
	    "cpplint",
	    "css-lsp",
	    "darker",
	    "docker-language-server",
	    "dotenv-linter",
	    "editorconfig-checker",
	    "emmet-ls",
	    "emmylua_ls",
	    "emmylua-codeformat",
	    "eslint_d",
	    "gci",
	    "gopls",
	    "gradle-language-server",
	    "hadolint",
	    "harper-ls",
	    "isort", -- Python isort
	    "java-language-server",
	    "json-lsp",
	    "mbake",
	    "mesonlsp",
	    "postgrestools",
	    "prettierd",
	    "prettydiff",
	    "protolint",
	    "pyrefly",
	    "ruff",
	    "rust-analyzer",
	    "shellharden",
	    "sqls",
	    "terraform-ls",
	    "uv",
	    "yaml-language-server",
    }
}

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Toggle line diagnostics' })
vim.keymap.set('n', '<leader>dD', '<cmd>Telescope diagnostics<cr>', { desc = 'Workspace diagnostics list' })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Explorer --
vim.keymap.set("n", "<leader>ee", function()
  -- Look for an existing, open explorer instance
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer then
    explorer:close()
  else
    Snacks.explorer()
  end
end, { desc = "Toggle Snacks Explorer" })

vim.keymap.set("n", "<leader>ef", function()
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer then
    if explorer:is_focused() then
      -- If inside the explorer, jump back to the previous code window
      vim.cmd("wincmd p")
    else
      -- If explorer is open but we are in code, focus the explorer
      explorer:focus()
    end
  else
    -- Optional: If it isn't open at all, open it
    Snacks.explorer()
  end
end, { desc = "Toggle Focus to Explorer" })

-- Bufferline --
for i = 1, 9 do
  vim.keymap.set('n', '<leader>b' .. i, function()
    require('bufferline').go_to(i, true)
  end, { desc = 'Go to buffer ' .. i })
end

vim.keymap.set('n', '<leader>bl', '<cmd>Telescope buffers<cr>', { desc = 'List open buffers' })
vim.keymap.set("n", "<leader>bc", function() Snacks.bufdelete() end, { desc = "Close Buffer" })

-- Cursor Switching --
vim.keymap.set('n', '<leader>cp', '<C-o>', { desc = 'Go to previous cursor position' })
vim.keymap.set('n', '<leader>cn', '<C-i>', { desc = 'Go to next cursor position' })

-- Go To --
vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', { desc = 'LSP Go to Definition' })
vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', { desc = 'LSP Go to Usages (References)' })

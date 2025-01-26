local wk = require("which-key")
wk.add({
    -- { "<leader>fb", function() print("hello") end, desc = "Foobar" },

    {"<leader>q", group="Session", icon={icon =""}},
    {"<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Load Last Session", mode = "n"},

    {"<leader>t", group="[T]ree", icon={icon =""}},
    {"<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "[T]oggle", mode = "n"},
    {"<leader>tf", "<cmd>NvimTreeFocus<cr>", desc = "[F]ocus", mode = "n"},
    
    {"<leader>b", group="[B]uffer", icon={icon=""}},
    {"<leader>b1", "<cmd>BufferLineGoToBuffer1<cr>", desc = "1", mode = "n"},
    {"<leader>b2", "<cmd>BufferLineGoToBuffer2<cr>", desc = "2", mode = "n"},
    {"<leader>b3", "<cmd>BufferLineGoToBuffer3<cr>", desc = "3", mode = "n"},
    {"<leader>b4", "<cmd>BufferLineGoToBuffer4<cr>", desc = "4", mode = "n"},
    {"<leader>b5", "<cmd>BufferLineGoToBuffer5<cr>", desc = "5", mode = "n"},
    {"<leader>b6", "<cmd>BufferLineGoToBuffer6<cr>", desc = "6", mode = "n"},
    {"<leader>b7", "<cmd>BufferLineGoToBuffer7<cr>", desc = "7", mode = "n"},
    {"<leader>b8", "<cmd>BufferLineGoToBuffer8<cr>", desc = "8", mode = "n"},
    {"<leader>b9", "<cmd>BufferLineGoToBuffer9<cr>", desc = "9", mode = "n"},
    {"<leader>bc", "<cmd>bd<cr>", desc = "[C]lose", mode = "n"},

    {"<leader>c", group="[C]ursor", icon={icon="󰇀"}},
    {"<leader>cp", "<c-o>", desc = "[P]revious", mode = "n"},
    {"<leader>cn", "<c-i>", desc = "[N]ext", mode = "n"},

    {"<leader>v", group="[V]im", icon={icon=""}},
    {"<leader>vnh", "<cmd>noh<cr>", desc = "[N]o [H]ighlight", mode = "n"},

    {"<leader>l", group="[L]SP", icon={icon=""}},
    {"<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "[D]efinition", mode = "n"},
    {"<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "[H]elp", mode = "n"},

    {"<leader>d", group="[D]iagnostic", icon={icon=""}},
    {"<leader>do", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "[O]pen Float", mode = "n"},
    {"<leader>dp", "<cmd>lua vim.diagnostic.goto_previous()<cr>", desc = "Goto [P]revious", mode = "n"},
    {"<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Goto [N]ext", mode = "n"},

    {"<c-space>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "[L]SP [S]ignature [H]elp", mode = "i"},

    {"jk", "<Esc>", desc = "Normal Mode", mode = "i"},
    {"jk", "<Esc>", desc = "Normal Mode", mode = "v"},
})
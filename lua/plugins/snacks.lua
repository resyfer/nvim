return {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
                bigfile = { enabled = true },
                dashboard = {
                        enabled = true,
                        preset = {
				-- Idk why normal text is shown lopsided on the dashboard.
                                header=
[[              __
              / _|
   _ __ ___  ___ _   _| |_ ___ _ __
  | '__/ _ \/ __| | | |  _/ _ \ '__|
| | |  __/\__ \ |_| | ||  __/ |
|_|  \___||___/\__, |_| \___|_|
      __/ |
     |___/ ]]
                        }
                },
                explorer = { enabled = true },
                indent = { enabled = true },
                input = { enabled = true },
                picker = { enabled = true },
                notifier = { enabled = true },
                quickfile = { enabled = true },
                scope = { enabled = true },
                scroll = { enabled = true },
                statuscolumn = { enabled = false },
                words = { enabled = true },
        },
}

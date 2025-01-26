return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = [[
                       __          
                      / _|         
  _ __ ___  ___ _   _| |_ ___ _ __ 
 | '__/ _ \/ __| | | |  _/ _ \ '__|
 | | |  __/\__ \ |_| | ||  __/ |   
 |_|  \___||___/\__, |_| \___|_|   
                 __/ |             
                |___/              ]]
            },
            sections = {
                { section = "header" },
                {
                  pane = 2,
                  section = "terminal",
                  cmd = "colorscript -e square",
                  height = 5,
                  padding = 1,
                },
                { section = "keys", gap = 1, padding = 1 },
                {
                  pane = 2,
                  icon = " ",
                  desc = "Browse Repo",
                  padding = 1,
                  key = "b",
                  action = function()
                    Snacks.gitbrowse()
                  end,
                },
                function()
                  local in_git = Snacks.git.get_root() ~= nil
                  local cmds = {
                    {
                      icon = " ",
                      title = "Git Status",
                      cmd = "clear && git --no-pager diff --stat -B -M -C",
                      height = 10,
                    },
                    {
                      title = "Open Issues",
                      cmd = [[
                            # Fish shell
                            clear
                            set output (gh issue list -L 3 &> /tmp/resyfer.git)
                            if test $status -eq 0
                                cat /tmp/resyfer.git
                            else
                                echo "Not a GitHub repository."
                            end
                        ]],
                      key = "i",
                      action = function()
                        vim.fn.jobstart("gh issue list --web", { detach = true })
                      end,
                      icon = " ",
                      height = 3,
                    },
                    {
                      icon = " ",
                      title = "Open PRs",
                      cmd = [[
                            # Fish shell
                            clear
                            set output (gh pr list -L 3 &> /tmp/resyfer.git)
                            if test $status -eq 0
                                cat /tmp/resyfer.git
                            else
                                echo "Not a GitHub repository."
                            end
                        ]],
                      key = "p",
                      action = function()
                        vim.fn.jobstart("gh pr list --web", { detach = true })
                      end,
                      height = 3,
                    },
                  }
                  return vim.tbl_map(function(cmd)
                    return vim.tbl_extend("force", {
                      pane = 2,
                      section = "terminal",
                      enabled = in_git,
                      padding = 1,
                      ttl = 5 * 60,
                      indent = 3,
                    }, cmd)
                  end, cmds)
                end,
                { section = "startup" },
              },
        }
    },
    keys = {
        -- { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    },
    init = function()
    vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
            Snacks.debug.inspect(...)
        end
        _G.bt = function()
            Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
        end,
    })
    end,
}
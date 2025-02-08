return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    actions = {
      open_file = {
        resize_window = true, -- Resize the window when opening a file
        window_picker = {
          enable = true, -- Allow window picker to choose the window
        },
      },
    },
    update_focused_file = {
      enable = true, -- Automatically focus on the file when it's opened
      update_cwd = true, -- Update the current working directory when focusing
    },
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 60,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
  }
}

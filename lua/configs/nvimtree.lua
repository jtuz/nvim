return {
  sync_root_with_cwd = false,
  git = {
    enable = true,
  },
  view = {
    side = "left",
    width = 45,
    relativenumber = true,
  },
  renderer = {
    root_folder_label = function (path)
      return " " .. vim.fn.fnamemodify(path, ":t")
    end,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

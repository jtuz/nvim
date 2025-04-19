return {
  {
    "natecraddock/sessions.nvim",
    lazy = false,
    config = function()
      require("sessions").setup {
        events = { "WinEnter" },
        session_filepath = vim.fn.stdpath "data" .. "/sessions/",
        absolute = true,
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      bigfile = { enabled = false },
      bufdelete = { enabled = false },
      dashboard = { enabled = false },
      debug = { enabled = false },
      dim = { enabled = true }, -- NOTE: use it!
      explorer = { enabled = false },
      git = { enabled = false },
      gitbrowse = { enabled = false },
      health = { enabled = false },
      image = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      layout = { enabled = false },
      lazygit = {
        enabled = true,
        configure = true,
        config = {
          gui = {
            border = "double",
          },
        },
        theme_path = vim.fs.normalize(vim.fn.stdpath "cache" .. "/lazygit-theme.yml"),
      },
      notify = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      profiler = { enabled = false },
      quickfile = { enabled = true },
      rename = { enabled = false },
      scroll = { enabled = false },
      scratch = { enabled = false },
      statuscolumn = {
        enabled = true,
        folds = {
          open = true,
        },
      },
      styles = { enabled = false},
      terminal = { enabled = false },
      toggle = { enabled = false },
      win = { enabled = false },
      words = { enabled = false },
      zen = { enabled = false },
    },
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>lf",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Git file history",
      },
    },
  },
}

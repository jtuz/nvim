return {
  {
    "natecraddock/sessions.nvim",
    lazy = false,
    config = function()
      require("sessions").setup {
        events = { "WinEnter" },
        session_filepath = ".nvim/session",
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
      debug = { enabled = false },
      git = { enabled = false },
      gitbrowse = { enabled = false },
      lazygit = { enabled = true },
      notify = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = false },
      toggle = { enabled = false },
      win = { enabled = false },
      words = { enabled = false },
    },
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>lf",
        function ()
          Snacks.lazygit.log_file()
        end
      }
    },
  },
}

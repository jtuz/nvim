return {
  {
    "grafana/vim-alloy",
    lazy = false,
  },
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown", -- If you decide to lazy-load anyway
    config = function()
      dofile(vim.g.base46_cache .. "markview")
      require("markview").setup()
    end,
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup {
        -- builtin_marks = { ".", "<", ">", "^" },
        builtin_marks = { " ", " ", " ", " " },
        mappings = {
          next = "]'",
          prev = "['",
          delete_buf = "m<space>",
        },
      }
    end,
  },
  {
    -- FIXME: <C-b>, zz shortcuts are failing
    "karb94/neoscroll.nvim",
    lazy = true,
    keys = { "<C-d>", "<C-u>", "<C-e>", "<C-f>", "<C-y>", "zt", "zb" },
    opts = {
      mappings = {
        "<C-u>",
        "<C-d>",
        "<C-e>",
        "<C-f>",
        "<C-y>",
        "zt",
        "zb",
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TodoTrouble" },
    dependencies = {
      {
        "folke/todo-comments.nvim",
        opts = {},
      },
    },
    config = function()
      dofile(vim.g.base46_cache .. "trouble")
      require("trouble").setup()
    end,
  },
}

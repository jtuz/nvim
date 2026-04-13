return {
  {
    "grafana/vim-alloy",
    lazy = false,
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
    -- NOTE: <C-b> is disabled due wezterm conflicts
    "karb94/neoscroll.nvim",
    lazy = true,
    keys = { "<C-d>", "<C-u>", "<C-e>", "<C-f>", "<C-y>", "zt", "zb", "zz" },
    opts = {
      mappings = {
        "<C-u>",
        "<C-d>",
        "<C-e>",
        "<C-f>",
        "<C-y>",
        "zt",
        "zb",
        "zz",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    opts = {},
    config = function()
      dofile(vim.g.base46_cache .. "todo")
      require("todo-comments").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TodoTrouble" },
    config = function()
      dofile(vim.g.base46_cache .. "trouble")
      require("trouble").setup()
    end,
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>dg",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>so",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols outline (Trouble)",
      },
      {
        "<leader>gr",
        "<cmd>Trouble lsp_references toggle focus=true<cr>",
        desc = "LSP References (Trouble)",
      },
      {
        "<leader>sy",
        "<cmd>Trouble lsp_document_symbols toggle focus=true<cr>",
        desc = "LSP document symbols (Trouble)",
      },
    },
  },
}


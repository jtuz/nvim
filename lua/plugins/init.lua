return {
  ----------- Overwrite defaults ------------
  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },
  {
    "stevearc/conform.nvim",
    opts = require "configs.formatting",
    event = "BufWritePre",
    -- event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.linting")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
      {
        "debugloop/telescope-undo.nvim",
        config = function()
          vim.keymap.set("n", "<leader>fu", "<CMD>Telescope undo<CR>", { desc = "Find undo" })
        end,
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    dependencies = {
      { "yioneko/nvim-yati" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = require "configs.blankline",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        enabled = false,
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
        config = function()
          require "configs.none-ls"
        end,
      },
      {
        "simrat39/symbols-outline.nvim",
        config = function()
          require("symbols-outline").setup {
            show_numbers = true,
            show_relative_numbers = true,
          }
        end,
      },
      {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        event = "LspAttach",
        opts = {
          create_autocmd = false,
          -- configurations go here
          show_dirname = false,
          show_basename = false,
          attach_navic = false,
          kinds = require "configs.barbecue",
        },
        dependencies = {
          "SmiteshP/nvim-navic",
          config = function()
            require("nvim-navic").setup()
          end,
        },
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  ------------ Custom plugins ---------------
  {
    "tpope/vim-abolish",
    lazy = false,
  },
  {
    "tpope/vim-repeat",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "tpope/vim-sleuth",
    lazy = false,
  },
  {
    "tommcdo/vim-exchange",
    lazy = false,
  },
  {
    "matze/vim-move",
    lazy = false,
  },
  {
    "godlygeek/tabular",
    lazy = false,
  },
  {
    "gpanders/nvim-parinfer",
    event = "InsertEnter",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "chentoast/marks.nvim",
    lazy = false,
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
    opts = { mappings = {
      "<C-u>",
      "<C-d>",
      "<C-e>",
      "<C-f>",
      "<C-y>",
      "zt",
      "zb",
    } },
  },
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
    "rcarriga/nvim-dap-ui",
    lazy = false,
    config = function()
      require("dapui").setup()
      require("dap.ext.vscode").load_launchjs(".nvim/launch.json", nil)
    end,
    dependencies = {
      { "nvim-neotest/nvim-nio" },
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "configs.dap_config"
        end,
      },
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          local mason_venv_path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
          require("dap-python").setup(mason_venv_path)
        end,
      },
      {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function(_, opts)
          require("dap-go").setup(opts)
        end,
      },
    },
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
    "folke/todo-comments.nvim",
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}

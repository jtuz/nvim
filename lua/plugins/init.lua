return {
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  ----------- Overriding NvChad defaults ------------
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        undo = {
          use_delta = true,
        },
      },
      defaults = {
        preview = {
          timeout = 750,
        },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          vertical = {
            mirror = true,
            prompt_position = "top",
            preview_height = 0.6,
            preview_cutoff = 40,
          },
          width = 0.85,
          height = 0.9,
        },
      },
    },
    dependencies = {
      { "nvim-telescope/telescope-ui-select.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        build = "make",
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
    -- disable nvim-tree and enable netrw to download spell files
    -- enabled = false,
    opts = {
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
        root_folder_label = function(path)
          return " " .. vim.fn.fnamemodify(path, ":t")
        end,
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      yati = {
        enable = true,
        default_fallback = "auto",
      },
      indent = {
        enable = false,
      },
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "css",
        "dockerfile",
        "editorconfig",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gotmpl",
        "groovy",
        "haskell",
        "helm",
        "html",
        "htmldjango",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "powershell",
        "regex",
        "ruby",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "yaml",
      },
    },
    dependencies = {
      { "yioneko/nvim-yati" },
    },
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
}

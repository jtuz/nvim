return {
  ----------- Overriding NvChad defaults ------------
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions_list = { "fzf", "undo" },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
      defaults = {
        preview = {
          timeout = 750,
        },
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = true,
            prompt_position = "top",
            width = 0.7,
            height = 0.95,
            preview_height = 0.6,
            preview_cutoff = 40,
          },
        },
      },
    },
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
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "groovy",
        "haskell",
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shfmt",
        -- Markdown
        "marksman",
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "json-lsp",
        "html-lsp",

        -- shell
        "bash-language-server",

        -- python
        "pyright",
        "flake8",
        "isort",
        "black",
        "debugpy",
        "ruff",

        -- Golang
        "gopls",
        "goimports",
        "golines",
        "delve",
        "golangci-lint",

        -- xml
        "lemminx",
        "powershell-editor-services",

        -- yaml
        "yaml-language-server",
        "yamlfmt",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "┊", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
}

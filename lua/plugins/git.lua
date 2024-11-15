return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function opts(desc)
          return { buffer = bufnr, desc = desc }
        end

        local map = vim.keymap.set

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true }
          else
            gs.nav_hunk "next"
          end
        end, { desc = "Next Hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true }
          else
            gs.nav_hunk "prev"
          end
        end, { desc = "Prev Hunk" })

        map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
        map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
        map("n", "<leader>bl", gs.blame_line, opts "Blame Line")
        map("n", "<leader>bf", gs.blame, opts "Blame File")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function()
      dofile(vim.g.base46_cache .. "diffview")
      require("diffview").setup()
    end,
  },
}

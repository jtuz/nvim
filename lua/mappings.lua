require "nvchad.mappings"
local map = vim.keymap.set
local delmap = vim.keymap.del

-- Disable mappings
delmap("n", "<C-s>")
delmap("n", "<C-c>")
delmap("n", "<C-n>")
delmap("n", "<leader>/")
delmap("n", "<leader>b")
delmap("n", "<leader>gt")
delmap("n", "<leader>e")
-- Disable NvTerm shortcuts
delmap("n", "<A-h>")
delmap("t", "<A-h>")
delmap("n", "<A-v>")
delmap("t", "<A-v>")
delmap("n", "<leader>h")
delmap("n", "<leader>v")

-- new terminals
map("n", "<leader>tx", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.3, id="htoggleTerm" }
end, { desc = "Terminal New horizontal term" })

map("n", "<leader>tv", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.3, id="vtoggleTerm" }
end, { desc = "Terminal New vertical window" })

-- Telescope
map("n", "<leader>gf", function()
  require("telescope.builtin").git_files()
end, { desc = "Find git files" })
map("n", "<leader>gs", function()
  require("telescope.builtin").git_status()
end, { desc = "Git status" })
map("n", "<leader>sp", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor {})
end, { desc = "Spelling Suggestions" })

-- Nvim tree
map("n", "<leader>ft", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvimtree" })

-- Spell
map("n", "<F2>", "<Esc><cmd> setlocal spell spelllang=en<CR>", { desc = "ENG spelling" })
map("n", "<F3>", "<Esc><cmd> setlocal spell spelllang=es<CR>", { desc = "ESP spelling" })
map("n", "<F4>", "<Esc><cmd> setlocal nospell<CR>", { desc = "Disable spelling" })

-- fugitive
map("n", "<leader>gb", "<cmd> Git blame <CR>", { desc = "git blame" })
map("n", "<leader>gh", "<cmd> diffget //2 <CR>", { desc = "diffget //2" })
map("n", "<leader>gl", "<cmd> diffget //3 <CR>", { desc = "diffget //3" })

-- Vim Ninja Skills
map("n", "<Up>", "<NOP>", { desc = "Disable Up" })
map("n", "<Down>", "<NOP>", { desc = "Disaple Down" })
map("n", "<Left>", "<NOP>", { desc = "Disable Left" })
map("n", "<Right>", "<NOP>", { desc = "Disable Right" })
--
-- Normally these are not good mappings, but I have left/right on my thumb
-- cluster, so navigating tabs is quite easy this way.
map("n", "<left>", "gT")
map("n", "<right>", "gt")

-- Misc
map("v", ">", ">gv", { desc = "Doesn't exit visual mode" })
map("v", "<", "<gv", { desc = "Doesn't exit visual mode" })
map("n", ">>", ">>_", { desc = "Indent" })
map("n", "<<", "<<_", { desc = "Remove indentation" })

-- Toggle some settings
map("n", "<leader>wp", "<cmd>set wrap!<CR>", { desc = "toggle wrap lines"})

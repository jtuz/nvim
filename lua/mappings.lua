require "nvchad.mappings"
local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Disable mappings
nomap("n", "<C-s>")
nomap("n", "<C-c>")
nomap("n", "<C-n>")
nomap("n", "<leader>b")
nomap("n", "<leader>gt")
-- Disable NvTerm shortcuts
nomap("n", "<A-h>")
nomap("t", "<A-h>")
nomap("n", "<A-v>")
nomap("t", "<A-v>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")

-- new terminals
map("n", "<leader>tx", function()
  require("nvchad.term").new { pos = "sp", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp", size = 0.3 }
end, { desc = "Terminal New vertical window" })

-- Telescope
map("n", "<leader>sy", function ()
  require("telescope.builtin").lsp_document_symbols()
end, { desc = "Find document symbols" })
map("n", "<leader>gr", function ()
  require("telescope.builtin").lsp_references()
end, { desc = "Find document references" })
map("n", "<leader>dg", function ()
  require("telescope.builtin").diagnostics()
end, { desc = " Document diagnostics" })
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

-- Personal Tools
map("n", "<leader>jq", "<Esc><cmd>%!jq .<CR><Esc><cmd> set filetype=json<CR>", { desc = "Format Json" })

-- Misc
map("v", ">", ">gv", { desc = "Doesn't exit visual mode" })
map("v", "<", "<gv", { desc = "Doesn't exit visual mode" })

-- navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

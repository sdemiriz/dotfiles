
local map = vim.keymap.set

---- Nvim Core

-- Move V-LINE selection up and down with J and K 
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Unbind Ex mode entry because nobody likes it
map("n", "Q", "<nop>")

-- Move to adjacent split pane 
map("n", "<C-h>", "<C-W><Left>")
map("n", "<C-j>", "<C-W><Down>")
map("n", "<C-k>", "<C-W><Up>")
map("n", "<C-l>", "<C-W><Right>")

---- Plugins

-- NvimTree
-- Open or close NvimTree with one command
map("n", "<C-n>", "<cmd>:NvimTreeFindFileToggle<CR>")

-- ToggleTerm
-- Open or close ToggleTerm terminal with one command
map("n", "<C-\\>", "<cmd>:ToggleTerm<CR>")
map("i", "<C-\\>", "<cmd>:ToggleTerm<CR>")
map("t", "<C-\\>", "<cmd>:ToggleTerm<CR>")

-- [Snakemake] Run common testing and running commands using Snakemake
map("n", "<leader>smt", "<cmd>:TermExec cmd='snakemake -np'<CR>")
map("n", "<leader>smr", "<cmd>:TermExec cmd='snakemake -j1 --use-conda'<CR>")

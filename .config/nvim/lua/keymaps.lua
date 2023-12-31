-- Mapping shorthand
local map = vim.keymap.set

-- Autosave on Escape
map('i', '<esc>', '<esc>:w<CR>')

-- U for redo, (u is undo by default)
map('n', 'U', '<C-r>')

-- Disable arrow key navigation
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')

-- Move between buffers
map('n', 'H', ':bprev<CR>')
map('n', 'L', ':bnext<CR>')

-- Move visual selection up and down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Automatically add matching pair
map('i', '[', '[]<Left>')
map('i', '(', '()<Left>')
map('i', '{', '{}<Left>')
map('i', '"', '""<Left>')
map('i', "'", "''<Left>")
map('i', '<', '<><Left>')

-- Center search result on screen
map('n', 'n', 'nzzz')
map('n', 'N', 'Nzzz')

-- NvimTree keybinds
map('n', '<leader>nt', ':NvimTreeToggle<CR>')
map('n', '<leader>nf', ':NvimTreeFocus<CR>')

-- LaTeX compilation keybinds
map('n', '<leader>lc', ':!pdflatex %<CR><CR>')
map('n', '<leader>bc', ':!pdflatex %<CR> <bar> :!bibtex %<CR> <bar> :!pdflatex %<CR>')

-- map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
-- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

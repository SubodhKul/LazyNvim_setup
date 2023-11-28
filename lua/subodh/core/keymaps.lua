vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i","jj","<ESC>")

-- nvim tree
keymap.set("n","<leader>e",":NvimTreeToggle<CR>")
keymap.set("n","<leader>w","<C-w>w") -- switch between windows: tree>editor>tree

--telescope
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>") 
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>")
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>")
--

--buffers

local builtin = require("telescope.builtin")

-- Neotree.nvim
vim.keymap.set('n', '<C-n>', ':Neotree toggle<cr>', { noremap = true })

-- Telescope.nvim
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Telescope colorscheme' })

-- Move lines up and down in Normal mode using Alt
vim.keymap.set("n", "<A-k>", ":silent m .-2<CR>==", { noremap = true })  -- Move current line up
vim.keymap.set("n", "<A-j>", ":silent m .+1<CR>==", { noremap = true })  -- Move current line down

-- Move lines up and down in Visual mode using Alt
vim.keymap.set("v", "<A-k>", ":silent m '<-2<CR>gv=gv", { noremap = true })  -- Move selected lines up
vim.keymap.set("v", "<A-j>", ":silent m '>+1<CR>gv=gv", { noremap = true })  -- Move selected lines down

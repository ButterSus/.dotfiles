vim.opt.mousemoveevent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true

vim.cmd.colorscheme "catppuccin"

vim.opt.swapfile = false

vim.opt.splitright = true
vim.opt.splitbelow = true

-- highlight the line number of the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- enable cursor-styling
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.termguicolors = true

vim.opt.cmdheight = 0

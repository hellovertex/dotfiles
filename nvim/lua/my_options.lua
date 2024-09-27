-- Added from https://www.youtube.com/watch?v=87AXw9Quy9U&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft&index=2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true

-- Set line numbers -- 2024-09-26 -- Added to replace vim.cmd("set number") calls -
vim.opt.number = true
vim.opt.relativenumber = true

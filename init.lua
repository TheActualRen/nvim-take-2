vim.o.number = true
vim.o.relativenumber = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.wrap = true
vim.o.swapfile = false
vim.o.signcolumn = "yes"
-- vim.o.winborder = "rounded"

vim.g.mapleader = " "

require("config.lazy")

-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
-- local g = vim.g

opt.swapfile = false
opt.relativenumber = true
opt.scrolloff = 999
opt.wrap = false

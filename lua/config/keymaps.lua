vim.keymap.set("n", "<CR><CR>", "<C-w>w", {noremap=true, silent=true})
vim.opt.timeoutlen=300
vim.keymap.set("i", "jj", "<Esc>", {silent=true})
vim.keymap.set("n", "ss", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

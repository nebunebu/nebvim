require("oil").setup({})

-- TODO: mv to whichkey
vim.keymap.set("n", "<BS>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

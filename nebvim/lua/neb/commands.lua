vim.api.nvim_create_user_command("FloatingMpv", function(opts)
	local url = opts.args
	local cmd = string.format(
		'hyprctl dispatch exec "[float; size 45%% 45%%; move 20 40; pin; noinitialfocus] mpv %s"',
		vim.fn.shellescape(url)
	)
	vim.fn.jobstart(cmd)
end, { nargs = 1 })

-- Optional: Add a key mapping for the command
vim.api.nvim_set_keymap("n", "<leader>fm", ":FloatingMpv ", { noremap = true })

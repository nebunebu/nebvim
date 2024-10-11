require("git-dev").setup({
	-- keys = {
	-- 	function()
	-- 		local repo = vim.fn.input("Repository name / URI: ")
	-- 		if repo ~= "" then
	-- 			require("git-dev").open(repo)
	-- 		end
	-- 	end,
	-- 	desc = "[O]pen a remote git repository",
	-- },
	-- opener = function(dir, _, selected_path)
	-- 	-- vim.cmd("Oil " .. vim.fn.fnameescape(dir))
	-- 	vim.cmd("Triptych " .. vim.fn.fnameescape(dir))
	-- 	if selected_path then
	-- 		vim.cmd("edit " .. selected_path)
	-- 	end
	-- end,
	ui = {
		close_after_ms = 1500,
	},
	cd_type = "tab",
	opener = function(dir, _, selected_path)
		vim.cmd("tabnew")
		vim.cmd("Oil " .. dir)
		if selected_path then
			vim.cmd("edit " .. selected_path)
		end
		vim.cmd("Triptych")
	end,
})

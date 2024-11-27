local theta = require("alpha.themes.theta")
local dashboard = require("alpha.themes.dashboard")

local header = {
	type = "text",
	val = {
		[[ ███████████████████████████████████████ ]],
		[[ █▄─▀█▄─▄█▄─▄▄─█▄─▄─▀█▄─█─▄█▄─▄█▄─▀█▀─▄█ ]],
		[[ ██─█▄▀─███─▄█▀██─▄─▀██▄▀▄███─███─█▄█─██ ]],
		[[ ▀▄▄▄▀▀▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▀▀▄▀▀▀▄▄▄▀▄▄▄▀▄▄▄▀ ]],
	},
	opts = {
		position = "center",
		hl = "SpecialKey",
	},
}
local subheader = {
	type = "text",
	val = {
		[[ ───── embrace the silence ───── ]],
	},
	opts = {
		position = "center",
		hl = "Operator",
	},
}

local links = {
	type = "group",
	val = {
		{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
		{ type = "padding", val = 1 },
		dashboard.button("c", "󱄅  .nix-config", ":e $HOME/.nix-config/flake.nix <CR>"),
		dashboard.button("n", "  nebvim", ":e $HOME/.nebvim/flake.nix <CR>"),
		dashboard.button("a", "  ags", ":e $HOME/.config/ags/flake.nix <CR>"),
		dashboard.button("v", "󱉼  obsidian vault", ":e $HOME/.vault/index.md <CR>"),
		-- dashboard.button("b", " blog", ":qa<CR>"),
		-- dashboard.button("w", "󰖬  wiki", ":e $HOME/.wiki/index.md <CR>"),
	},
	position = "center",
}

local footer = {
	type = "text",
	val = require("fortune").get_fortune(),
	opts = {
		position = "center",
		hl = "function",
	},
}

local recent = require("alpha.themes.theta").config.layout[4]
theta.config = {
	layout = {
		{ type = "padding", val = 2 },
		header,
		{ type = "padding", val = 2 },
		subheader,
		{ type = "padding", val = 2 },
		links,
		{ type = "padding", val = 2 },
		recent,
		{ type = "padding", val = 0 },
		footer,
		{ type = "padding", val = 0 },
	},
	opts = {
		noautocmd = false,
		redraw_on_resize = true,
		setup = function()
			vim.api.nvim_create_autocmd("DirChanged", {
				pattern = "*",
				callback = function()
					require("alpha").redraw()
				end,
			})
		end,
	},
}

require("alpha").setup(theta.config)

vim.api.nvim_create_user_command("AlphaTab", "tabnew | Alpha", {})

-- FIX: hiding cursor
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "AlphaReady",
-- 	desc = "hide cursor for alpha",
-- 	callback = function()
-- 		local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
-- 		hl.blend = 100
-- 		vim.api.nvim_set_hl(0, "Cursor", hl)
-- 		vim.opt.guicursor:append("a:Cursor/lCursor")
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("BufUnload", {
-- 	buffer = 0,
-- 	desc = "show cursor after alpha",
-- 	callback = function()
-- 		local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
-- 		hl.blend = 0
-- 		vim.api.nvim_set_hl(0, "Cursor", hl)
-- 		vim.opt.guicursor:remove("a:Cursor/lCursor")
-- 	end,
-- })

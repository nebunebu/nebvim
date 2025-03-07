return {
	"cellular-automaton",
	keys = {
		{ "<leader>c", group = "cellular automaton" },
		{ "<leader>cr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "make it rain" },
		{ "<leader>cr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "make it rain" },
		{ "<leader>cg", "<cmd>CellularAutomaton game_of_life<CR>", desc = "game of life" },
		{ "<leader>cs", "<cmd>CellularAutomaton scramble<CR>", desc = "scramble" },
		{ "<leader>cl", "<cmd>CellularAutomaton slide<CR>", desc = "scramble" },
	},
	after = function()
		local config = {
			fps = 50,
			name = "slide",
		}

		config.update = function(grid)
			for i = 1, #grid do
				local prev = grid[i][#grid[i]]
				for j = 1, #grid[i] do
					grid[i][j], prev = prev, grid[i][j]
				end
			end
			return true
		end

		require("cellular-automaton").register_animation(config)
	end,
}

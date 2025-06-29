return {
	"Kaiser-Yang/blink-cmp-avante",
	config = function()
		require("blink-cmp-avante").setup({
			sources = {
				avante = true, -- or require("avante.config").llm.engine ~= "copilot"
			},
		})
	end,
}

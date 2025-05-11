-- lua/plugins/screenkey.lua
return {
	"NStefan002/screenkey.nvim",
	opts = {
		timeout = 1500, -- wie lange der letzte Druck angezeigt bleibt (in ms)
		winblend = 20, -- Transparenz des Floating-Fensters
		filter = nil, -- z.B. { "i", "n" } beschränkt Anzeige auf bestimmte Modi
	},
	keys = {
		-- Toggle mit <leader>k
		{
			"<leader>k",
			function()
				require("screenkey").toggle()
			end,
			desc = "Toggle Screenkey",
		},
	},
}

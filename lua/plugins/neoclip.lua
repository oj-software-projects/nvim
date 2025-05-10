-- File: lua/plugins/neoclip.lua
return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neoclip").setup({
			history = 1000,
			enable_persistent_history = true,
			db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
			preview = true,
		})
		-- Telescope-Extension aktivieren
		require("telescope").load_extension("neoclip")
		-- Keymap für schnellen Zugriff
		vim.keymap.set("n", "<leader>sn", "<cmd>Telescope neoclip<CR>", { desc = "Clipboard History" })
	end,
}

return({
	"ojroques/nvim-osc52",
	cond = function()
		return vim.env.SSH_CONNECTION ~= nil -- nur bei SSH aktivieren
	end,
	config = function()
		-- Deaktiviere system clipboard, damit kein Fehler durch win32yank kommt
		vim.opt.clipboard = ""

		local osc52 = require("osc52")

		osc52.setup({
			max_length = 0,
			trim = false,
			silent = false,
		})

		-- Automatisches OSC52 bei jedem Yank (auch yy, y$, etc.)
		vim.api.nvim_create_autocmd("TextYankPost", {
			callback = function()
				if vim.v.event.operator == "y" then
					local reg = vim.v.event.regname
					if reg == "" then
						reg = '"'
					end
					osc52.copy_register(reg)
				end
			end,
		})

		-- Optional: Logische Bestätigung im UI
		vim.notify("[OSC52] Yank-Integration für SSH aktiviert", vim.log.levels.INFO)
	end,
})

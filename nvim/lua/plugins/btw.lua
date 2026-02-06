return {
	"letieu/btw.nvim",
	config = function()
		local btw = require('btw')
		btw.setup({
			text = "I use Neovim (BTW)",
		})
	end,
}

local opts = vim.tbl_extend("force", {
	provider = "copilot",
	file_selector = {
		provider = "snacks",
	},
}, nixCats("avanteOpts") or {})

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	enabled = require("nixCatsUtils").enableForCategory("ai"),
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = opts,
}

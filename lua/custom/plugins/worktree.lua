return {
	"polarmutex/git-worktree.nvim",
	enabled = require("nixCatsUtils").enableForCategory("worktree"),
	version = "^2",
	dependencies = { "nvim-lua/plenary.nvim" },
}

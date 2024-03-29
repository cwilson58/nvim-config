return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "javascript", "typescript", "java", "c", "markdown" },
			highlight = { enable = true },
			indent = { enable = true },
		})
		require("nvim-treesitter.install").compilers = { "clang" }
	end,
}

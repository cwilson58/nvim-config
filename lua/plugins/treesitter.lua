return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")
		config.setup({})
		config
			.install({
				"lua",
				"javascript",
				"typescript",
				"java",
				"c",
				"markdown",
				"yaml",
				"json",
				"c_sharp",
				"css",
				"html",
			})
			:wait(300000)
		require("nvim-treesitter.install").compilers = { "clang" }

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)

				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}

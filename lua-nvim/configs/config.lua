-- TSModuleInfo

local M = {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names or "all"
			ensure_installed = {
				"css",
				"html",
				"svelte",
				"javascript",
				"typescript",
				"python",
				"vim",
				"bash",
				"sql",
				"prisma",
				"go",
				"gomod",
				"gosum",
			},
		})
	end,
}
return M

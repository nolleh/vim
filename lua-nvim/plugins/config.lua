-- TSModuleInfo
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

-- require "williamboman/mason.nvim".setup {
--   ensure_installed = {
--     -- lua stuff
--     "lua-language-server",
--     "stylua",
--
--     -- web dev
--     "css-lsp",
--     "html-lsp",
--     "svelte-language-server",
--     "typescript-language-server",
--     "deno",
--     "json-lsp",
--
--     -- shell
--     "shfmt",
--     "shellcheck",
--     --
--     "pyright",
--   },
-- }
--
--

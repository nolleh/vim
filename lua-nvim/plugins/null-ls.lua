local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
	b.formatting.prettier,
	b.formatting.stylua,
	b.formatting.shfmt,
	b.formatting.black,
	b.formatting.prismaFmt,

	b.formatting.prettier.with({
		filetypes = {
			"javascript",
			"typescript",
			"css",
			"scss",
			"html",
			"json",
			"yaml",
			"markdown",
			"graphql",
			"md",
			"vimwiki",
			"txt",
		},
	}),
	b.formatting.black.with({
		"python3",
	}),

	b.diagnostics.tsc,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
}

--vim.api.nvim_create_autocmd("BufWritePost", {
--  pattern = "*",
--  command = "lua vim.lsp.buf.format()",
--})

null_ls.setup({
	debug = true,
	sources = sources,
})

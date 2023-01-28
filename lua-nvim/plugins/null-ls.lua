local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.prettier,
  b.formatting.stylua,
  b.formatting.shfmt,
  b.formatting.black,

  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  b.formatting.prettier.with {
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
  },
}

--vim.api.nvim_create_autocmd("BufWritePost", {
--  pattern = "*",
--  command = "lua vim.lsp.buf.format()",
--})

null_ls.setup {
  debug = true,
  sources = sources,
}

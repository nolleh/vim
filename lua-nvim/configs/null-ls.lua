local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion
local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.eslint,
  formatting.shfmt,
  formatting.black,
  formatting.prismaFmt.with({
    prefer_local = "./node_modules/.bin/",
  }),
  formatting.gofmt,
  -- diagnostics.eslint,
  -- diagnostics.tsc,
  -- code_actions.eslint,
  code_actions.gitsigns,
  completion.spell,

  formatting.prettier.with({
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
      "hbs",
    },
  }),
  diagnostics.tsc,
  diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
}

null_ls.setup({
  debug = true,
  sources = sources,
})
--vim.api.nvim_create_autocmd("BufWritePost", {
--  pattern = "*",
--  command = "lua vim.lsp.buf.format()",
--})

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    bash = { "shfmt" },
    css = { "prettier" },
    html = { "prettier" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    svelte = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },

    cpp = { "clang-format" },
    go = { "gofmt" },
    cs = { "csharpier" },
  },
}

return options

require "nvim-treesitter.configs".setup {
  -- A list of parser names or "all"
  ensure_installed = {
    "css",
    "html",
    "svelte",
    "typescript",
    "python",
    "vim",
    "bash",
    "sql"
  }
}

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
require("jaq-nvim").setup {
  cmds = {
    -- Uses vim commands
    internal = {
      lua = "luafile %",
      vim = "source %"
    },

    -- Uses shell commands
    external = {
      markdown = "glow %",
      python   = "python3 %",
      go       = "go run %",
      sh       = "sh %",
      html     = "open %"
    }
  },
}

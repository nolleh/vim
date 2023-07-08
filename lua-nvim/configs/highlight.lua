-- TSModuleInfo

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- A list of parser names or "all"
    ensure_installed = {
      "bash",
      "css",
      "json",
      "html",
      "svelte",
      "javascript",
      "typescript",
      "python",
      "vim",
      "vimdoc",
      "regex",
      "sql",
      "prisma",
      "go",
      "gomod",
      "gosum",
      "yaml",
      "glimmer",
    },
  },
}
return M

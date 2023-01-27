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
  -- UI settings
	ui = {
		-- Auto-save the current file
		-- before executing it
		autosave = true,
		-- Start in insert mode
		startinsert = false,

		-- Switch back to current file
		-- after using Jaq
		wincmd = false,

		-- Floating Window / FTerm settings
		float = {
			-- Floating window border (see ':h nvim_open_win')
			border = "rounded",

			-- Num from `0 - 1` for measurements
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,

			-- Highlight group for floating window/border (see ':h winhl')
			border_hl = "FloatBorder",
			float_hl = "Normal",

			-- Floating Window Transparency (see ':h winblend')
			blend = 0,
		},
  }
}

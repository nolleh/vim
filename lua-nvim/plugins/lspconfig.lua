local nvim_lsp = require "lspconfig"

-- TODO Fix cssls completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = {
  "html",
  "cssls",
  "tsserver",
  "pyright",
  "svelte",
}

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>fm", function()
    vim.lsp.buf.format { async = true }
  end, bufopts)

  client.server_capabilities.document_formatting = false
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local util = require "lspconfig/util"
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs { "*", ".*" } do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  -- return exepath "python3" or exepath "python" or "python"
  return "python3"
end

nvim_lsp.pyright.setup {
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
}

require("jaq-nvim").setup {
  cmds = {
    -- Uses vim commands
    internal = {
      lua = "luafile %",
      vim = "source %"
    },

    -- Uses shell commands
    external = {
      vimwiki  = "glow %",
      markdown = "glow %",
      python   = get_python_path(".") .. " %",
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

local nvlsp = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- server_configurations
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "pyright",
  "svelte",
  "bashls",
  "prismals",
  "gopls",
  "cmake",
  "ccls",
  "kotlin_language_server",
  "jsonls",
  "tailwindcss",
  "csharp_ls"
}

local util = require("lspconfig/util")
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  -- return exepath("python3") or exepath("python") or "python"
  return "python3"
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    before_init = function(_, config)
      if lsp == "pyright" then
        config.settings.python.pythonPath = get_python_path(config.root_dir)
      end
      if lsp == "ccls" then
        config = require("custom.configs.ccls").config
      end
    end,
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--     vim.api.nvim_set_hl(0, group, {})
-- end

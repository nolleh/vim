local dap = require("dap")
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb",
  name = "lldb",
}

dap.adapters.coreclr = {
  type = "executable",
  command = ".local/share/nvim/lazy/netcoredbg-macOS-arm64.nvim/netcoredbg",
  args = "--interpreter=vscode",
}

require("dap-go").setup()

require("nvim-dap-virtual-text").setup({})
vim.g.dap_virtual_text = true

-- require("persistent-breakpoints").setup({
--   load_breakpoints_event = { "BufReadPost" }
-- })

local dapui = require("dapui")
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- vim.highlight.create('DapBreakpoint', { ctermbg = 0, guifg = '#993939', guibg = '#31353f' }, false)
-- vim.highlight.create('DapLogPoint', { ctermbg = 0, guifg = '#61afef', guibg = '#31353f' }, false)
-- vim.highlight.create('DapStopped', { ctermbg = 0, guifg = '#98c379', guibg = '#31353f' }, false)

local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local namespace = vim.api.nvim_create_namespace("dap-hlng")
vim.api.nvim_set_hl(namespace, "DapBreakpoint", { fg = "#eaeaeb", bg = "#ffffff" })
vim.api.nvim_set_hl(namespace, "DapLogPoint", { fg = "#eaeaeb", bg = "#ffffff" })
vim.api.nvim_set_hl(namespace, "DapStopped", { fg = "#eaeaeb", bg = "#ffffff" })

vim.fn.sign_define("DapBreakpoint", {
  text = "🔴",
  -- text = '',
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapLogPoint",
  { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

local lldb = {
  name = "Launch lldb",
  type = "lldb",
  request = "launch",
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
  cwd = "${workspaceFolder}",
  stopOnEntry = false,
  args = {},
  runInTerminal = false,
}

require("dap").configurations.rust = {
  lldb,
}

-- require("netcoredbg-macOS-arm64").setup(require("dap"))
local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function getCurrentFileDirName()
  local fullPath = vim.fn.expand("%s:p:h") -- Get the full path of the directory containing the current file
  local dirName = fullPath:match("([])")   -- Extract the directory name
  return dirName
end

local function get_dll_path()
  local debugPath = vim.fn.expand('%:p:h') .. '/bin/Debug'
  if not file_exists(debugPath) then
    return vim.fn.getcwd()
  end
  local command = 'find "' .. debugPath .. '" -maxdepth 1 -type d -name "*net*" -print -quit'
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  result = result:gsub("[\r\n]+$", "")   -- Remove trailing newline and carriage return
  if result == "" then
    return debugPath
  else
    local potentialDllPath = result .. '/' .. getCurrentFileDirName() .. '.dll'
    if file_exists(potentialDllPath) then
      return potentialDllPath
    else
      return result == "" and debugPath or result .. '/'
    end
    --        return result .. '/' -- Adds a trailing slash if a net folder is found
  end
end

dap.configuration.cs = {
  type = "coreclr",
  name = "launch - netcoredbg",
  request = "launch",
  justMyCode = false,
  stopOnEntry = false,
  program = function()
    return vim.fn.input("Path to dll", get_dll_path(), "file")
  end,
  env = function()
    local profile = vim.fn.input("profile: ", "docker")
  return require("custom.configs.profile").profile[profile]
  end,
}

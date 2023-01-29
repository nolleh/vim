-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- add command, options, autocmds here

-- Variables: {{{

-- vim.g.python3_host_prog = "${PYENV_ROOT}/versions/neovim/bin/python"

vim.opt.mouse = "a"
vim.opt.autoindent = true

-- if you do not desclare "local",
-- lua variables are global by default --> that include function
local set = vim.opt
set.ts = 2
set.shiftwidth = 2
set.expandtab = true
--set.foldmethod = syntax
--vim.g.autosave = true

-- }}}

-- Plugin configurations: {{{
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.tagbar_position = "rightbelow"
--vim.g.mapleader = ","
vim.g.pipemysql_login_info = {
  {
    description = "127.0.0.1",
    mysql_username = "root",
  },
}

vim.g.pipemysql_option = "-vvv"
-- vim.g.pipemysql_pager = "grcat ~/.grcat"

vim.g.vimwiki_list = {
  {
    path = "~/Documents/workspace_github/vimwiki/private/",
    syntax = "markdown",
    ext = ".md",
  },
  {
    path = "~/Documents/workspace_github/vimwiki/public",
    syntax = "markdown",
    ext = ".md",
  },
}

-- vim.g.colorizer_auto_color = 1
-- vim.g.colorizer_auto_filetype="*"
-- vim.g.colorizer_disable_bufleave = 1

-- Augroups: {{{
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local projectDrawer = augroup("ProjectDrawer", {})

autocmd("VimEnter", {
  pattern = "*",
  command = ":NvimTreeToggle",
  group = projectDrawer,
})

autocmd("VimEnter", {
  pattern = "*",
  command = ":wincmd l",
  group = projectDrawer,
})

autocmd("BufRead,BufNewFile", {
  pattern = "*.sql",
  command = "set filetype=mysql",
})

autocmd("BufRead,BufNewFile", {
  pattern = "*.md",
  command = "set filetype=markdown",
})

vim.api.nvim_create_user_command("ReloadConfig", "source %", {})

local zoomed = false
function ZoomToggle()
  if zoomed then
    vim.cmd ":tab close"
    zoomed = false
  else
    vim.cmd ":tab split"
    zoomed = true
  end
end

vim.api.nvim_create_user_command("ZoomToggle", ZoomToggle, {})

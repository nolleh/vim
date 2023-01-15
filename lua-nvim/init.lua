
-- add command, options, autocmds here

-- Variables: {{{

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
vim.g.mapleader = ","
-- vim.g.quickrun_config.html = { command = "open"}
-- vim.g.quickrun_config.python = { command = "python3"}

--vim.api.nvim_command([[ 
--  let g:quickrun_config.html = { "command" : "open" }
--  let g:quickrun_config.python = { "command" : "python3" }
--]])

vim.g.vimwiki_list = {
  {
    path = "~/Documents/workspace_github/vimwiki/private/",
    syntax =  "markdown",
    ext = ".md"
  },
  {
    path= "~/Documents/workspace_github/vimwiki/public",
    syntax = "markdown",
    ext = ".md"
  }
}

require("jaq-nvim").setup({
  external = {
    markdown = "glow %",
    python = "python3 %"
  }
})

-- Augroups: {{{
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local project_drawer = augroup("ProjectDrawer", {})

autocmd("VimEnter", {
  pattern = "*",
  command = ":NvimTreeToggle",
  group = project_drawer
})

autocmd("VimEnter", {
  pattern = "*",
  command = ":wincmd l",
  group = project_drawer
})

--- }}}

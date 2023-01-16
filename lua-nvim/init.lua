
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
vim.g.pipemysql_login_info = {
  {
    description = "127.0.0.1",
    mysql_username = "root"
  }
}

vim.g.pipemysql_option = "-vvv"
vim.g.pipemysql_pager = "more -1"

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

autocmd(
  "BufRead,BufNewFile", {
  pattern = "*.sql",
  command = "set filetype=mysql"
})

--- }}}
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "svelte" },
})

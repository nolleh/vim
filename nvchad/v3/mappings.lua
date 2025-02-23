local map = vim.keymap.set

-- declared in NvChadV2
map("n", "<leader>cc", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local config = require("ibl.config").get_config(bufnr)
  local scope = require("ibl.scope").get(bufnr, config)
  if scope then
    local row, column = scope:start()
    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { row + 1, column })
  end
end, { desc = "Jump to current context" })

--
map("n", "<tab>", "")
map("n", "<S-tab>", "")

map("n", "<C-p>", ":MarkdownPreviewToggle<CR>")
map("n", "<leader><leader>r", ":Jaq<CR>")
map("n", "<leader>.z", ":ZoomToggle<CR>")
map("n", "<leader>mm", ":MinimapToggle<CR>")
map("n", "<leader>cd", ":cd %:h<CR>:pwd<CR>")
map("n", "<leader>c-", ":cd -<CR>")

map("n", "tn", function()
  require("nvchad.tabufline").next()
end, { desc = "Goto next buffer" })

map("n", "tp", function()
  require("nvchad.tabufline").prev()
end, { desc = "Goto prev buffer" })

-- lsp
map("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "vertical split lsp definition" })
map("n", "gs", ":split | lua vim.lsp.buf.definition()<CR>", { desc = "split lsp definition" })

-- lspsaga
map("n", "<leader>lra", "<cmd> Lspsaga rename <CR>", { desc = "Lspsaga rename" })
map("n", "<leader>lol", "<cmd> Lspsaga outline <CR>", { desc = "Lspsaga outline" })
map("n", "<leader>lci", "<cmd> Lspsaga incoming_calls <CR>", { desc = "Lspsaga incoming calls" })
map("n", "<leader>lco", "<cmd> Lspsaga outgoing_calls <CR>", { desc = "Lspsaga outgoing calls" })
map("n", "<leader>lca", "<cmd> Lspsaga code_action <CR>", { desc = "Lspsaga code action" })
map("n", "<leader>lpd", "<cmd> Lspsaga peek_definition <CR>", { desc = "Lspsaga peek definition" })
map("n", "<leader>lpt", "<cmd> Lspsaga peek_type_definition <CR>", { desc = "Lspsaga peek type definition" })
map("n", "<leader>l[e", "<cmd> Lspsaga diagnostic_jump_prev <CR>", { desc = "Lspsaga diagnostic jump prev" })
map("n", "<leader>l]e", "<cmd> Lspsaga diagnostic_jump_next <CR>", { desc = "Lspsaga diagnostic jump next" })
map("n", "<leader>lf", "<cmd> Lspsaga finder <CR>", { desc = "Lspsaga finder" })
map("n", "<leader>lk", "<cmd> Lspsaga hover_doc <CR>", { desc = "Lspsaga hover doc" })
map("n", "<leader>lK", "<cmd> Lspsaga hover_doc ++keep <CR>", { desc = "Lspsaga hover doc keep" })

-- git
map("n", "<leader>cb", "<cmd> Telescope git_bcommits <CR>", { desc = "Git commits on current buffer" })

map(
  "n",
  "<leader>gl",
  "<cmd> Jaq float git log --all --graph --pretty=format:'%Cgreen%ad%Creset %C(auto)%h%d %s %C(bold black)<%aN>%Creset' --date=format-local:'%Y-%m-%d %H:%M (%a)' <CR>",
  { desc = "Git graph with pretty tag" }
)

--map("n","<leader>cl",
--   function()
--     require("telescope.builtin").git_commits({
--       -- git_command = { "git", "log", "--pretty=oneline", "--graph", "--decorate", "--abbrev-commit", "--", "." },
--       git_command = { "git", "log", "--all", "--graph", "--pretty=format:'%Cgreen%ad%Creset %C(auto)%h%d %s %C(bold black)<%aN>%Creset'", "--date=format-local:'%Y-%m-%d %H:%M (%a)'" }
--     })
--   end,
--   "Git commit log with graph",
-- },

map("n", "<leader>ax", ":%bd | e# | bd# | :NvimTreeToggle<CR>", { desc = "close all buf but current" })

map("n", "gr", function()
  require("omnisharp_extended").telescope_lsp_references(
    require("telescope.themes").get_ivy({ excludeDefinition = true })
  )
end, { noremap = true })
map("n", "gd", require("omnisharp_extended").telescope_lsp_definition, { noremap = true })
map("n", "<leader>D", function()
  require("omnisharp_extended").telescope_lsp_references()
end, { noremap = true })
map("n", "gi", require("omnisharp_extended").telescope_lsp_implementation, { noremap = true })

map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "dap continue" })
map("n", "<leader>dl", function()
  require("dap").run_last()
end)
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "dap toggle breakpoint" })
map("n", "<leader>ds", function()
  require("dap").step_over()
end, { desc = "dap step over" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "dap step into" })
map("n", "<leader>do", function()
  require("dap").step_out()
end, { desc = "dap step out" })
map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { desc = "dap toggle ui" })

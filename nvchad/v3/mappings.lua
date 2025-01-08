local map = vim.keymap.set

map("n", "<C-p>", ":MarkdownPreviewToggle<CR>")
map("n", "<leader><leader>r", ":Jaq<CR>")
map("n", "<leader>.z", ":ZoomToggle<CR>")
map("n", "<leader>mm", ":MinimapToggle<CR>")
map("n", "<leader>cd", ":cd %:h<CR>:pwd<CR>")
map("n", "<leader>c-", ":cd -<CR>")
map("n", "tn", function()
  require("nvchad.tabufline").tabuflineNext()
end, { desc = "Goto next buffer" })

map("n", "tp", function()
  require("nvchad.tabufline").tabuflinePrev()
end, { desc = "Goto prev buffer" })

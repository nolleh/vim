local M = {}

M.general = {
  n = {
    ["<C-p>"] = { ":MarkdownPreviewToggle<CR>" },
    ["<leader><leader>r"] = { ":Jaq<CR>" },
    ["<leader>.z"] = { ":ZoomToggle<CR>" },
  },
  v = {
    ["<leader><leader>r"] = { ":Jaq<CR>" },
  },
}

return M

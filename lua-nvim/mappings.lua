local M = {}

M.general = {
  n = {
    ["<leader>b"] = { ":buffers<CR>:buffer ", "list buffers" },
    ["<C-p>"] = { ":MarkdownPreviewToggle<CR>" },
    ["<leader>fg"] = { ":Telescope live_grep<CR>" },
    ["<leader><leader>r"] = { ":Jaq<CR>" },
    ["<leader>.z"] = { ":ZoomToggle<CR>" },
  },
  v = {
    ["<leader><leader>r"] = { ":Jaq<CR>" },
  },
}

return M

local M = {}

M.general = {
  n = {
    ["<leader>b"] = {":buffers<CR>:buffer ", "list buffers"},
    ["<C-p>"] = {":MarkdownPreviewToggle<CR>"},
    ["<leader>fg"] = {":Telescope live_grep<CR>"},
    ["<leader><leader>r"] = {" :QuickRun<CR>" }
  },
  v = {
    ["<leader><leader>r"] = {" :QuickRun<CR>" }
  }
}

return M

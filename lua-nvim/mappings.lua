local M = {}

M.general = {
  n = {
    ["<C-p>"] = { ":MarkdownPreviewToggle<CR>" },
    ["<leader><leader>r"] = { ":Jaq<CR>" },
    ["<leader>cg"] = { ":Jaq float cgpt<CR>"},
    ["<leader>.z"] = { ":ZoomToggle<CR>" },
    ["<leader>mm"] = { ":MinimapToggle<CR>" },

    -- lsp
    ["gv"] = {
      ":vsplit | lua vim.lsp.buf.definition()<CR>",
      "vertial split lsp definition",
    },
    ["gs"] = {
      ":split | lua vim.lsp.buf.definition()<CR>",
      "split lsp definition",
    },

    ["<leader>ax"] = { ":%bd | e# | bd# | :NvimTreeToggle<CR>", "close all buf but current" },
  },
  v = {
    ["<leader><leader>r"] = { ":Jaq<CR>" },
  },
}

return M

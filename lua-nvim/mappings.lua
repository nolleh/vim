local M = {}

M.general = {
  n = {
    ["<C-p>"] = { ":MarkdownPreviewToggle<CR>" },
    ["<leader><leader>r"] = { ":Jaq<CR>" },
    ["<leader>rc"] = { ":Jaq float " },
    ["<leader>cg"] = { ":Jaq float cgpt<CR>" },
    ["<leader>rp"] = { ":Jaq float pnpm exec prisma " },
    ["<leader>.z"] = { ":ZoomToggle<CR>" },
    ["<leader>mm"] = { ":MinimapToggle<CR>" },
    ["<leader>cd"] = { ":cd %:h<CR>:pwd<CR>" },

    -- lsp
    ["gv"] = {
      ":vsplit | lua vim.lsp.buf.definition()<CR>",
      "vertical split lsp definition",
    },
    ["gs"] = {
      ":split | lua vim.lsp.buf.definition()<CR>",
      "split lsp definition",
    },

    -- git
    ["<leader>cb"] = {
      "<cmd> Telescope git_bcommits <CR>",
      "Git commits on current buffer",
    },

    ["<leader>cl"] = {
      function()
        require("telescope.builtin").git_commits({
          git_command = { "git", "log", "--pretty=oneline", "--graph", "--decorate", "--abbrev-commit", "--", "." },
        })
      end,
      "Git commit log with graph",
    },

    ["<leader>ax"] = { ":%bd | e# | bd# | :NvimTreeToggle<CR>", "close all buf but current" },
  },
  v = {
    ["<leader><leader>r"] = { ":Jaq<CR>" },
  },
}

return M

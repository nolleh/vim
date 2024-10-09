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

    -- lspsaga
    ["<leader>lpra"] = {
      "<cmd> Lspsaga rename <CR>",
      "Lspsaga rename",
    },

    ["<leader>lpol"] = {
      "<cmd> Lspsaga outline <CR>",
      "Lspsaga outline",
    },

    ["<leader>lpci"] = {
      "<cmd> Lspsaga incoming_calls <CR>",
      "Lspsaga incoming calls",
    },

    ["<leader>lpco"] = {
      "<cmd> Lspsaga outgoing_calls <CR>",
      "Lspsaga outgoing calls",
    },

    ["<leader>lpca"] = {
      "<cmd> Lspsaga code_action <CR>",
      "Lspsaga code action",
    },

    ["<leader>lppd"] = {
      "<cmd> Lspsaga peek_definition <CR>",
      "Lspsaga peek definition",
    },

    ["<leader>lppt"] = {
      "<cmd> Lspsaga peek_type_definition <CR>",
      "Lspsaga peek type definition",
    },

    ["<leader>lp[e"] = {
      "<cmd> Lspsaga diagnostic_jump_prev <CR>",
      "Lspsaga diagnostic jump prev",
    },

    ["<leader>lp]e"] = {
      "<cmd> Lspsaga diagnostic_jump_next <CR>",
      "Lspsaga diagnostic jump next",
    },

    ["<leader>lpf"] = {
      "<cmd> Lspsaga finder <CR>",
      "Lspsaga finder",
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

    --buf
    ["tn"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["tp"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
  v = {
    ["<leader><leader>r"] = { ":Jaq<CR>" },
  },
  i = {
    ["<C-g>"] = {
      "copilot#Accept('<CR>')",
      opts = {
        noremap = true,
        expr = true,
        silent = true,
        replace_keycodes = false,
      },
    },
  },
}

return M

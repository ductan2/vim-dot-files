return {
  -- Disable K hover và <c-k> signature help để giữ custom keymaps (5kzz và <Up> in insert)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            { "<c-k>", false, mode = "i" },
          },
        },
      },
    },
  },

  -- Cấu hình LSP và tools
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Language Servers
        "typescript-language-server", -- TypeScript/JavaScript
        "eslint-lsp", -- ESLint
        "tailwindcss-language-server", -- TailwindCSS
        "html-lsp", -- HTML
        "css-lsp", -- CSS
        "prisma-language-server", -- Prisma ORM

        -- Formatters
        "prettier", -- Code formatter
        "stylua", -- Lua formatter

        -- Linters
        "eslint_d", -- Fast ESLint daemon
      },
    },
  },

  -- Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "tsx",
        "javascript",
        "json",
        "html",
        "css",
        "scss",
        "graphql",
        "prisma",
        "dockerfile",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
      },
    },
  },
}

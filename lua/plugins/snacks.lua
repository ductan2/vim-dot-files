return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<D-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<D-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<D-j>"] = "preview_scroll_down",
            ["<D-k>"] = "preview_scroll_up",
          },
        },
      },
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", "target", ".git" },
        },
        git_diff = {
          group = true,
        },
      },
    },
  },
}

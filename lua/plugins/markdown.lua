return {
  -- No auto-formatting for markdown (don't touch Vietnamese prose)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = {},
        ["markdown.mdx"] = {},
      },
    },
  },
}

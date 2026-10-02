return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<D-j>"] = { "select_next", "fallback" },
      ["<D-k>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "show_documentation", "hide_documentation" },
    },
  },
}

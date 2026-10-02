-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Prefer the outer git root over per-package LSP workspace roots (monorepos like cdp-v3)
vim.g.root_spec = { ".git", "lsp", "cwd" }

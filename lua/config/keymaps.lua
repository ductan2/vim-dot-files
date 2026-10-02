-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Normal mode
map("n", "j", "jzz", { desc = "Down and center" })
map("n", "k", "kzz", { desc = "Up and center" })
map("n", "J", "5jzz", { desc = "5 lines down and center" })
map("n", "K", "5kzz", { desc = "5 lines up and center", silent = true })
map("n", "q", "b", { desc = "Word back" })

map("n", "W", "2w", { desc = "2 words forward" })
map("n", "T", "o<Esc>k", { desc = "New line below and stay" })
map("n", "D", "ved", { desc = "Delete to end of word" })
map("n", "Q", "vbd", { desc = "Delete word backward" })
map("n", "N", vim.lsp.buf.hover, { desc = "Hover" })
map("x", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map("n", "<C-c>", '"+yy', { desc = "Copy line to clipboard" })
map("x", "<D-c>", '"+y', { desc = "Copy to clipboard" })
map("n", "<D-c>", '"+yy', { desc = "Copy line to clipboard" })

-- Insert mode
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-e>", "<C-Right>", { desc = "Move word right" })

-- Floating terminal in the middle of the screen
local function toggle_terminal()
  Snacks.terminal(nil, {
    win = {
      position = "float",
      width = 0.8,
      height = 0.8,
      border = "rounded",
    },
  })
end
map("n", "<leader>tt", toggle_terminal, { desc = "Toggle floating terminal" })
-- Most terminals send <C-_> for Ctrl-/.
map("t", "<C-/>", toggle_terminal, { desc = "Toggle floating terminal" })
map("t", "<C-_>", toggle_terminal, { desc = "Toggle floating terminal" })

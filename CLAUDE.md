# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Tổng quan

Đây là cấu hình Neovim cá nhân sử dụng [LazyVim](https://lazyvim.org) - một distribution Neovim được cấu hình sẵn với lazy.nvim plugin manager.

## Kiến trúc codebase

### Entry Point
- `init.lua`: File khởi động chính, chỉ gọi `require("config.lazy")`
- `lua/config/lazy.lua`: Bootstrap lazy.nvim và thiết lập plugin manager

### Cấu trúc thư mục

```
lua/
├── config/          # Cấu hình Neovim core
│   ├── lazy.lua     # Plugin manager setup
│   ├── options.lua  # Vim options (hiện tại trống - kế thừa từ LazyVim defaults)
│   ├── keymaps.lua  # Custom key mappings
│   └── autocmds.lua # Auto commands (hiện tại trống - kế thừa từ LazyVim defaults)
└── plugins/         # Plugin specifications
    └── example.lua  # File mẫu (disabled với return {})
```

### Plugin System (lazy.nvim)

LazyVim sử dụng spec-based plugin configuration:
- Plugins được load tự động từ thư mục `lua/plugins/`
- Mỗi file trong `lua/plugins/` return một table chứa plugin specs
- Có thể override/extend LazyVim defaults bằng cách định nghĩa lại plugin với cùng tên

## Custom Keymaps

Các keymaps quan trọng được định nghĩa trong `lua/config/keymaps.lua`:

**Normal mode:**
- `j/k`: Di chuyển lên/xuống với auto-center (`jzz/kzz`)
- `J/K`: Di chuyển 5 dòng và center
- `q`: Word back (thay vì macro record)
- `W`: 2 words forward
- `T`: Tạo dòng mới bên dưới nhưng không vào insert mode
- `<C-c>`: Copy vào system clipboard
- `D`: Delete to end of word
- `Q`: Delete word backward

**Insert mode:**
- `jj`: Escape insert mode
- `<C-hjkl>`: Di chuyển cursor trong insert mode
- `<C-e>`: Move word right

## Định dạng code

### Lua formatting
- Tool: `stylua`
- Config: `stylua.toml`
  - Indent: 2 spaces
  - Column width: 120

Chạy format:
```bash
stylua .
```

## Làm việc với plugins

### Thêm plugin mới

Tạo file mới trong `lua/plugins/` hoặc chỉnh sửa existing file:

```lua
return {
  {
    "user/plugin-name",
    opts = {
      -- plugin options
    },
  },
}
```

### Override LazyVim plugin

```lua
return {
  {
    "plugin-name",
    opts = function(_, opts)
      -- modify opts
      return opts
    end,
  },
}
```

### Disable LazyVim plugin

```lua
return {
  { "plugin-name", enabled = false },
}
```

## LazyVim defaults

Cấu hình này kế thừa nhiều defaults từ LazyVim:
- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

Khi thêm customizations:
- `options.lua`: Override vim options
- `keymaps.lua`: Add hoặc override keymaps (existing customs sử dụng vim-specific motions)
- `autocmds.lua`: Add custom autocommands

## Lưu ý quan trọng

1. **Plugin loading**: Tất cả custom plugins được set `lazy = false` (load ngay lập tức). Chỉ LazyVim plugins mới được lazy-load mặc định.

2. **Custom keymaps**: Config này override một số keymaps standard (như `q`, `K`) với custom behavior. Luôn kiểm tra `keymaps.lua` trước khi thêm mappings mới.

3. **Neoconf/Neodev**: Đã enable Lua LSP với plugin support qua `.neoconf.json`.

4. **Version pinning**: Plugins không được pin version (`version = false`), luôn dùng latest git commit.

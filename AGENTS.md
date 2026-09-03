# AGENTS.md

## What This Is

Personal Neovim config built on **LazyVim** (lazy.nvim). This is a user config repo, not a plugin repo — there are no tests, builds, or CI.

## Structure

- `init.lua` → bootstrap only, loads `config.lazy`
- `lua/config/` — core: lazy setup, options, keymaps, autocmds
- `lua/plugins/` — custom plugin specs (one file per concern)
- `lua/util/` — small helpers
- `ftplugin/` — filetype-specific settings (go, cpp, make, rapid)
- `lazyvim.json` / `lazy-lock.json` — managed by lazy.nvim; do not hand-edit lockfile

## Key Facts

- **Formatter**: StyLua (`stylua.toml` at root: 2-space indent, 120 col width)
- **Picker**: FZF (not Telescope) — set via `vim.g.lazyvim_picker = "fzf"`
- **Autoformat**: disabled globally (`vim.g.autoformat = false`)
- **Tab width**: 4 spaces in code (softtabstop/shiftwidth/tabstop = 4)
- **LSP log level**: ERROR only
- **Python**: `/usr/bin/python3`
- **Plugin versions**: both `lazy.nvim` and `LazyVim` pinned to `version = false` (latest git)

## Language Extras Enabled

Go, C/C++ (clangd), Python, Java, TypeScript, Rust, Zig, JSON, YAML, TOML, SQL, Markdown

## Mason-installed Tools

neocmakelsp, bash-language-server, shellcheck, shfmt, html-lsp, dockerfile-language-server, lemminx, tree-sitter-cli, vim-language-server

## Non-LazyVim Plugins (see readme.md)

vim-dadbod-ui (DB UI), fzf/fzf-vim, accelerated-jk, suda.vim (sudo), Trans.nvim (Chinese translate), wildfire.vim

## Custom Keymaps Worth Knowing

- `s` prefix = navigation group (diagnostics, rename, code action, format, window nav)
- `S` = save, `Q` = quit
- `K/J` = move 5 lines up/down, `H/L` = move 14 chars left/right
- `\\` = jump to `<++>` placeholder (for code expansion)
- `<leader>h` = man pages (uses cppman for C++ files)
- LazyVim defaults for `<c-h/j/k/l>` and `<leader>bb` are explicitly removed

## Editing Conventions

- Use `stylua` for formatting
- Follow existing Lua style: 2-space indent in config files, consistent with stylua.toml
- No mouse (`vim.o.mouse = ""`)
- CJK-aware spell checking (`spelllang = { "en", "cjk" }`)
- File encodings prioritize UTF-8 with GBK/GB2312 fallbacks

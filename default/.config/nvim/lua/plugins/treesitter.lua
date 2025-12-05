-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "c_sharp",
      "css",
      "cpp",
      "fish",
      "html",
      "javascript",
      "json",
      "json5",
      "lua",
      "luap",
      "markdown",
      "markdown_inline",
      "nim",
      "nim_format_string",
      "python",
      "query",
      "typescript",
      "xml",
      "yaml",
      "vim",
      "vimdoc",
      -- add more arguments for adding more treesitter parsers
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true,
      multiwindow = false,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshould = 20,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
      on_attach = nil,
    },
  },
}

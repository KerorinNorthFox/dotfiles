-- Customize Mason

---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "markdownlint-cli2",
        "markdown-toc",
      },
    },
  },

  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        -- "debugpy", -- disable debugpy intallation due to unsolved install failed error.

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}

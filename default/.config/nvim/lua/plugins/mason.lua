-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "nimlangserver",

        -- install formatters
        "stylua",

        -- install debuggers
        -- "debugpy",

        -- install any other package
        "tree-sitter-cli",

        -- For Python
        "pyright",
        -- "ruff", -- TODO: 仮想環境を作れなかったというエラーが出る. python3.10-venvをインストールしろと出るが、インストールできない. pythonのバージョンを上げる必要がある?
        -- "ruff-lsp",

        -- For html, css, javascript, typescript, json
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "typescript-language-server",
        "prettierd",
      },
    },
  },
}

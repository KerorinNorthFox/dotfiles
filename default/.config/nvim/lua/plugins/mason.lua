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
        -- install LSP
        "astro-language-server",
        "lua-language-server",
        "nimlangserver",
        "fish-lsp",
        "emmet-ls", -- htmlやcssを楽に書けるEmmetを使用可能にする
        "tinymist",

        -- install formatters
        "stylua",
        "taplo",

        -- install linter
        "selene",

        -- install debuggers
        -- "debugpy",
        "codelldb",
        "js-debug-adapter",

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
        "svelte-language-server",
        "vtsls",

        -- For Rust
        "rust-analyzer",
      },
    },
  },
}

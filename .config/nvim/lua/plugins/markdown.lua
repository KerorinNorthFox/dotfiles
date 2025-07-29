return {
  -- markdownのプレビューを行う
  -- https://github.com/iamcco/markdown-preview.nvim
  -- コマンド
  -- :MarkdownPreview       # プレビューサーバー起動
  -- :MarkdownPreviewStop   # プレビューサーバー停止
  -- :MarkdownPreviewToggle # 起動/停止
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load { plugins = { "markdown-preview.nvim" } }
      vim.fn["mkdp#util#install"]()
    end,
    -- keys = {
    --   {
    --     "<leader>cp",
    --     ft = "markdown",
    --     "<cmd>MarkdownPreviewToggle<cr>",
    --     desc = "Markdown Preview",
    --   },
    -- },
    config = function() vim.cmd [[do FileType]] end,
  },

  -- markdownをレンダリングして表示する
  -- コマンド
  -- :RenderMarkdown (enable) # 開始
  -- :RenderMarkdown disable  # 停止
  -- :RenderMarkdown toggle   # 開始/停止
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = false,
      },
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, ops)
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = function() return require "render-markdown.state", enabled end,
        set = function(enabled)
          local m = require "render-markdown"
          if enabled then m.enable() end
        end,
      }):map "<leader>um"
    end,
  },
}

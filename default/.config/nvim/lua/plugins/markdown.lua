return {
  -- markdownのプレビューを行う (on community.lua)
  -- https://github.com/iamcco/markdown-preview.nvim
  -- コマンド
  -- :MarkdownPreview       # プレビューサーバー起動
  -- :MarkdownPreviewStop   # プレビューサーバー停止
  -- :MarkdownPreviewToggle # 起動/停止
  -- { "iamcco/markdown-preview.nvim" },

  -- markdownをレンダリングして表示する
  -- https://github.com/MeanderingProgrammer/render-markdown.nvim
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
    ft = { "markdown" },
    keys = {
      { "<Space>Mm", ":RenderMarkdown toggle<CR>" },
    },
  },
}

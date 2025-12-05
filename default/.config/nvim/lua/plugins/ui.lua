return {
  {
    -- neovimのコマンドラインを画面中央にフロートして表示 (on community.lua)
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
      -- lsp = {
      --   hover = {
      --     enabled = false,
      --   },
      --   signature = {
      --     enabled = false,
      --   },
      -- },
    },
  },
  -- 括弧間やインデントを視覚的に表示
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      line_num = {
        enable = true,
      },
    },
  },
  -- カーソルを滑らかに動かす
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
      smear_between_buffers = true, -- Be smooth cursor when switching buffers.
      -- scroll_buffer_space = true
    },
  },
  -- 画面下部ステータスラインを追加
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    opts = {
      component_separators = { left = "<", right = "<" },
      section_separators = { left = "", right = "" },
    },
  },
}

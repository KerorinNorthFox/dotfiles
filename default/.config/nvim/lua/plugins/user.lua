-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  -- カラーコードに色を付けて表示
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
  },
  -- ミニマップの右にスクロールバー用のスペースを空ける
  {
    "Isrothy/neominimap.nvim",
    opts = {
      float = {
        margin = {
          right = 1,
        },
      },
    },
  },
  -- スクロールバーを追加する
  {
    "petertriho/nvim-scrollbar",
    event = { "BufNewFile", "BufRead" },
    config = function() require("scrollbar").setup() end,
  },
  -- 検索時に検索結果を別ウィンドウでまとめて表示する
  {
    "kevinhwang91/nvim-hlslens",
    event = { "FilterWritePre" },
    keys = {
      { "<Leader>L", desc = "hlslens" },
    },
    config = function()
      require("hlslens").setup {
        calm_down = true,
        nearest_only = true,
      }
      vim.keymap.set({ "n", "x" }, "<Leader>L", function()
        vim.schedule(function()
          if require("hlslens").exportLastSearchToQuickfix() then vim.cmd "cw" end
        end)
        return ":noh<CR>"
      end, { expr = true })
    end,
  },
  -- 画面下部ステータスラインを追加
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    event = { "BufNewFile", "BufRead" },
    opts = {
      component_separators = { left = "<", right = "<" },
      section_separators = { left = "", right = "" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", "filesize" },
        lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
        lualine_y = { "searchcount", "selectioncount", "progress" },
        lualine_z = { "location" },
      },
      extensions = {
        "lazy",
        "mason",
        "neo-tree",
        "toggleterm",
      },
    },
  },
  -- 括弧間やインデントを視覚的に表示
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local palette = require("nightfox.palette").load "nordfox"
      return {
        chunk = {
          enable = true,
          style = {
            palette.cyan.bright,
            palette.red.bright,
          },
        },
        indent = {
          enable = true,
        },
        line_num = {
          enable = true,
          style = palette.cyan.base,
        },
      }
    end,
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
  -- Snacks.nvim : 便利なプラグインまとめ
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
      scroll = {
        enable = false,
      },
      zen = {
        enable = false,
      },
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}

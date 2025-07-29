-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {
  -- neovimのコマンドラインを画面中央にフロートして表示
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "L3MON4D3/LuaSnip",
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local lspconfig = require "lspconfig"
      local capabilities = require("blink.cmp").get_lsp_capabilities {
        textDocument = {
          completion = {
            snippetSupport = true,
          },
        },
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      }
    end,
  },

  -- コマンド等補完
  -- 参考: https://minerva.mamansoft.net/Notes/%F0%9F%93%9C2025-04-02+nvim-cmp%E3%81%8B%E3%82%89blink.cmp%E3%81%AB%E7%A7%BB%E8%A1%8C%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
      windows = {
        autocomplete = {
          border = "rounded",
        },
        documentation = {
          border = "",
          max_height = 50,
          auto_show_delay_ms = 250,
        },
        signature_help = {
          border = "rounded",
        },
      },
    },
    opts_extend = { "sources.default" },
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
      -- scroll_buffer_space = true,
    },
  },

  -- 画面下部にステータスラインを追加
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    opts = {
      component_separators = { left = "<", right = "<" },
      section_separators = { left = "", right = "" },
    },
  },

  -- エディタ上部にファイル選択できるドロップバーを追加
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
    },
    config = function()
      local dropbar_api = require "dropbar.api"
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },

  -- DiscordのアクティビティにNeovimを表示
  -- TODO:表示されない
  {
    "andweeb/presence.nvim",
    lazy = false,
    opts = {},
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {},
  },

  -- 便利なプラグインまとめ
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = false,
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

  -- jkでescが押せるようになる
  { "max397574/better-escape.nvim" },

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

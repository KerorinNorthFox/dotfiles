-- コマンドでneovimを便利にするプラグイン

return {
  -- space+mでブロックの展開と縮小を行う (on community.lua)
  -- { "Wansmer/treesj" },

  -- エディタ上部にファイル選択できるドロップバーを追加 (on community.lua)
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

  -- jkでescが押せるようになる
  { "max397574/better-escape.nvim" },
}

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typst" },
  -- import/override with your plugins folder
  -- タブバーとエディタ画面の間にドロップダウン式のパンくずリストを表示
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  -- neovimのコマンドラインをフロートして表示
  { import = "astrocommunity.utility.noice-nvim" },
  -- 括弧を一行<->複数行で切り替える
  { import = "astrocommunity.editing-support.treesj" },
  -- 現在選択中のウィンドウをわかりやすくハイライトする
  { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },
  -- ハイライトされたミニマップを表示する
  { import = "astrocommunity.split-and-window.neominimap-nvim" },
  -- 0-1の選択肢を持つ単語を切り替える
  { import = "astrocommunity.utility.nvim-toggler" },
}

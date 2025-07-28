-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  -- language packs
  --  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.fish" },
  --  { import = "astrocommunity.pack.html-css" },
  --  { import = "astrocommunity.pack.json" },
  --  { import = "astrocommunity.pack.markdown" },
  --  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.nim" },
  -- { import = "astrocommunity.pack.python" },
  --  { import = "astrocommunity.pack.sql" },
  --  { import = "astrocommunity.pack.svelte" },
  --  { import = "astrocommunity.pack.tailwindcss" },
  --  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.typst" },
  -- { import = "astrocommunity.pack.xml" },
  -- { import = "astrocommunity.pack.yaml" },
  -- others
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
}

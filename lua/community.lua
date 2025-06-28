-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  -- UI
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  -- Languages
  -- Coding
  -- -- Coding
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.laravel" },
  -- { import = "astrocommunity.pack.dart" },
  -- { import = "astrocommunity.pack.php" },
  -- Notes
  -- -- Notes
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
}

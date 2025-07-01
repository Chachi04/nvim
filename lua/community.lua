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
  { import = "astrocommunity.recipes.vscode-icons" },

  -- Languages
  -- -- Coding
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.blade" },
  { import = "astrocommunity.pack.php" },
  -- { import = "astrocommunity.pack.dart" },
  -- -- Notes
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },

  -- Code Runner
  { import = "astrocommunity.code-runner.compiler-nvim" },
  -- { import = "astrocommunity.code-runner.molten-nvim" },
  -- { import = "astrocommunity.code-runner.executor-nvim" },
  -- { import = "astrocommunity.code-runner.sniprun" }, -- in ./plugins/sniprun.lua

  -- Completion
  { import = "astrocommunity.completion.blink-cmp" },

  -- -- Copilot
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.completion.copilot-cmp" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Comment
  { import = "astrocommunity.comment.ts-comments-nvim" },

  -- Utils
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.recipes.neovide" },
}

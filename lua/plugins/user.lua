-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
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

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
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
      npairs.add_rules {
        -- specify a list of rules to add
        Rule(" ", " "):with_pair(function(options)
          local pair = options.line:sub(options.col - 1, options.col)
          return vim.tbl_contains({ "()", "[]", "{}", "$$" }, pair)
        end):with_del(function(options)
          local pair = options.line:sub(options.col - 1, options.col)
          return vim.tbl_contains({ "()", "[]", "{}", "$$" }, pair)
        end),
        Rule("( ", " )")
          :with_pair(function() return false end)
          :with_move(function(options) return options.prev_char:match ".%)" ~= nil end)
          :use_key ")",
        Rule("{ ", " }")
          :with_pair(function() return false end)
          :with_move(function(options) return options.prev_char:match ".%}" ~= nil end)
          :use_key "}",
        Rule("[ ", " ]")
          :with_pair(function() return false end)
          :with_move(function(options) return options.prev_char:match ".%]" ~= nil end)
          :use_key "]",
        Rule("$ ", " $")
          :with_pair(function() return false end)
          :with_move(function(options) return options.prev_char:match ".%$" ~= nil end)
          :use_key "$",
      }

      npairs.add_rules {
        Rule("(", ")", { "typst" }):with_pair(cond.after_text "$"),
        Rule('"', '"', { "typst" }):with_pair(cond.after_text "$"),
        Rule("$", "$", { "typst" }):with_move():use_key "$",
        Rule("_", "_", { "typst" })
          :with_pair(function(options)
            local line = options.line
            local col = options.col
            return col == 1 or line:sub(col - 1, col - 1):match "%s" ~= nil
          end)
          :with_move()
          :use_key "_",
        Rule("*", "*", { "typst" })
          :with_pair(function(options)
            local line = options.line
            local col = options.col
            return col == 1 or line:sub(col - 1, col - 1):match "%s" ~= nil
          end)
          :with_move()
          :use_key "*",
      }
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      -- opts variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

      -- Only insert new sources, do not replace the existing ones
      -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.typstyle,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
      },
    },
  },
  -- { "nvim-telescope/telescope.nvim" },
}

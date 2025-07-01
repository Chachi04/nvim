-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
----------------------------------------------------------------------------------------------

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = { -- Configure core features of AstroNvim
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    diagnostics = { -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      extension = {},
      filename = {},
      pattern = {},
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap

        wildignorecase = true,
        swapfile = false,
        scrolloff = 10,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        python3_host_prog = vim.fn.expand "$CONDA_PREFIX/bin/python",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- make cursor stay when concattinating with J
        J = { "mzJ`z" },

        -- Line Swapping
        ["<A-j>"] = { "<cmd>m .+1<CR>==" },
        ["<A-k>"] = { "<cmd>m .-2<CR>==" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<C-_>"] = { "<Cmd>normal gcc<CR>", desc = "Toggle Comment" },
        ["<C-/>"] = { "<Cmd>normal gcc<CR>", desc = "Toggle Comment" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- Compiler.nvim
        ["<Leader>rf"] = {
          "<cmd>CompilerOpen<CR>",
          desc = "Run file (Compiler.nvim)",
        },
        ["<Leader>rr"] = {
          "<cmd>CompilerRedo<CR>",
          desc = "Rerun compiler",
        },
        ["<Leader>rR"] = {
          "<cmd>CompilerStop<CR>" -- (Optional, to dispose all tasks before redo)
            .. "<cmd>CompilerRedo<CR>",
          desc = "Fresh rerun compiler",
        },
        ["<Leader>rt"] = {
          "<cmd>CompilerToggleResults<CR>",
          desc = "Show compiler results",
        },
        ["<Leader>rs"] = {
          "<cmd>SnipRun<CR>",
          desc = "Run SnipRun",
        },
      },
      i = {
        -- NOTE better undo breaks
        ["<Space>"] = { "<Space><C-g>u" },
        [","] = { ",<C-g>u" },
        ["."] = { ".<C-g>u" },
        ["!"] = { "!<C-g>u" },
        ["?"] = { "?<C-g>u" },

        -- Line Swapping
        ["<A-j>"] = { "<Esc><cmd>m .+1<CR>==gi" },
        ["<A-k>"] = { "<Esc><cmd>m .-2<CR>==gi" },
      },
      v = {
        -- Line Swapping
        ["<A-k>"] = { ":m '<-2<CR><CR>gv=gv" },
        ["<A-j>"] = { ":m '>+1<CR><CR>gv=gv" },
      },
    },
      markdown_settings = {
        {
          event = "BufEnter",
          pattern = "*.md",
          desc = "markdown settings",
          callback = function()
            vim.opt.tabstop = 2
            vim.opt.softtabstop = 2
            vim.opt.shiftwidth = 2

            vim.b.peek_open = false

            local toggle_peek = function()
              if not vim.b.peek_open then
                require("peek").open()
              else
                require("peek").close()
              end
              vim.b.peek_open = not vim.b.peek_open
            end

            vim.keymap.set("n", "<f3>", toggle_peek, { noremap = true, silent = true, buffer = true })
          end,
        },
      },
  },
}

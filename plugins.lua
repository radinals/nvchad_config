local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    init = function()
      require("core.utils").load_mappings "coderunner"
    end,
    config = true,
    cmd = { "RunCode", "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype" },
  },

  { "habamax/vim-godot", ft = "gdscript" },
  { "lervag/vimtex", ft = "tex" },

  {
    "NvChad/nvim-colorizer.lua",
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
  },

  {
    "TimUntersberger/neogit",
    init = function()
      require("core.utils").load_mappings "neogit"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
    cmd = "Neogit",
  },

  {
    "simrat39/symbols-outline.nvim",
    init = function()
      require("core.utils").load_mappings "SymbolsOutline"
    end,
    dependencies = "nvim-lspconfig",
    config = function(_)
      require "plugins.configs.symbols_outline"
    end,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
  },

  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require "codewindow"
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
    event = "VeryLazy",
  },

  {
    "cappyzawa/trim.nvim",
    init = function()
      require("trim").setup {}
    end,
    event = "VeryLazy",
  },

  {
    "gpanders/editorconfig.nvim",
    event = "VeryLazy",
  },

  {
    "vimwiki/vimwiki",
    event = "InsertEnter",
    ft = "wiki",
  },

  {
    enabled = false,
    "sakhnik/nvim-gdb",
    event = "VeryLazy",
    ft = {"c", "cpp"},
  },

  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function(_)
      require("symbol-usage").setup {
        vt_position = "end_of_line",
      }
      require("core.utils").load_mappings "SymbolsUsage"
    end,
  },

  {
    "hinell/lsp-timeout.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    "andweeb/presence.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require "plugins.configs.nvim_presence"
    end,
  },

  {
   "sotte/presenting.vim",
    event = "VeryLazy",
    cmd = "StartPresenting",
  },

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = "VeryLazy",
    ft = {"c", "cpp", "python", "sh"},
    config = function()
      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require('ufo').setup({
        preview = {
          win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
          },
        },
      })
    end,
  },

  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    config = function()
      require("core.utils").load_mappings "nvim_move"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    ft = {"c", "cpp"},
    init = function()
      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
        },
      }
      dap.configurations.c = dap.configurations.cpp
    end,
    config = function()
      require("core.utils").load_mappings "DapAdapter"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    ft = {"c", "cpp"},
    dependencies = "mfussenegger/nvim-dap",
    init = function()
      require("dapui").setup()
    end,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      require("core.utils").load_mappings "DapUI"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    ft = {"c", "cpp"},
    config = function ()

      require("lint").linters_by_ft = {
        cpp = {"clangtidy"},
        c = {"clangtidy"},
      }

      local clangtidy = require("lint" ).linters.clangtidy

      clangtidy.args = {
        '--quiet',
        '-checks=performance-*,bugprone-*'
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = "/bin/brave-browser"
    end,
    ft = { "markdown" },
  },

  {
    "mhartington/formatter.nvim",
    -- cmd = {"Format", "FormatWrite", "FormatLock", "FormatWriteLock"},
    config = function()
      require "custom.configs.formatter"
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          vim.cmd("FormatWrite")
        end,
      })
    end,
    ft = { "c", "cpp", "python" },
  }


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

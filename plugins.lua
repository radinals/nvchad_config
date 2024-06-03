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

  { "lervag/vimtex",
    config = function()
      require "custom.configs.vimtex"
    end,
    ft = "tex"
  },

  {
    "NvChad/nvim-colorizer.lua",
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
  },

  -- {
  --   "TimUntersberger/neogit",
  --   enable = false,
  --   init = function()
  --     require("core.utils").load_mappings "neogit"
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- required
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "sindrets/diffview.nvim", -- optional
  --     "ibhagwan/fzf-lua", -- optional
  --   },
  --   config = true,
  --   cmd = "Neogit",
  -- },

  {
    'stevearc/aerial.nvim',
    init = function()
      require("aerial").setup()
      require("core.utils").load_mappings "Aerial"
    end,
    ft = {"c", "cpp", "python" },
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
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
    enabled = false,
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
    event = "VeryLazy",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require "custom.configs.lsp_timeout"
    end,
  },

  {
    "andweeb/presence.nvim",
    enabled = false,
    event = "VeryLazy",
    -- config = function()
    --   require "plugins.configs.nvim_presence"
    -- end,
  },

  {
   "sotte/presenting.vim",
    ft = "md",
    cmd = "StartPresenting",
  },

  {
    "tpope/vim-fugitive",
    enabled = false,
    event = "VeryLazy",
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = "VeryLazy",
    ft = {"c", "cpp", "python", "sh", "md"},
    config = function()
      require "custom.configs.nvim_ufo"
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
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/neodev.nvim"},
    init = function()
      require("dapui").setup()
    end,
    config = function()
      require "custom.configs.nvim_dap"
      require("core.utils").load_mappings "DapUI"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    ft = {"c", "cpp"},
    config = function ()
      require "custom.configs.nvim_lint"
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
    cmd = {"Format", "FormatWrite", "FormatLock", "FormatWriteLock"},
    config = function()
      require "custom.configs.formatter"
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          vim.cmd("FormatWrite")
        end,
      })
    end,
    ft = { "c", "cpp", "python" },
  },

  {
    'nvim-orgmode/orgmode',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    ft = "org",
    config = function()
      -- Load treesitter grammar for org
      -- require('orgmode').setup_ts_grammar()
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/Documents/orgfiles/**/*',
        org_default_notes_file = '~/Documents/orgfiles/refile.org',
      })
    end,
  },

  {
    'cdelledonne/vim-cmake',
    ft = {"c", "cpp"},
    config = function()
      vim.g.cmake_command='cmake'
      vim.g.cmake_test_command='ctest'
      vim.g.cmake_default_config='Debug'
      vim.g.cmake_build_dir_location='./build'
    end,
  },

  {
    'jakemason/ouroboros',
    init = function()
      require("core.utils").load_mappings "ouroboros"
    end,
    ft = {"c", "cpp"},
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = {"Ouroboros"},
  },

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

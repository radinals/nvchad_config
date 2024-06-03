---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>wh"] = { "<cmd>split<CR>", "Split Window Horizontal", silent = true },
    ["<leader>wv"] = { "<cmd>vsplit<CR>", "Split Window Vertical", silent = true },
    ["<leader>wc"] = { "<cmd>quit<CR>", "Close Window", silent = true },
  },

  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.Aerial = {
  plugin = true,
  n = {
    ["<space>st"] = { "<cmd> AerialToggle <CR>", "Toggle Symbols Outline", silent = true },
  },
}

M.SymbolsUsage = {

  plugin = true,
  n = {

    ["<space>sh"] = {
      function()
        require("symbol-usage").toggle()
      end,
      "Toggle LSP Symbols Usage Count",
    },

    ["<space>sr"] = {
      function()
        require("symbol-usage").refresh()
      end,
      "Refresh LSP Symbols Usage Count",
    },

  },
}

M.DapAdapter = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Dap Breakpoint", silent=true },
    ["<leader>dc"] = { "<cmd>DapContinue<CR>", "Run Dap", silent=true },
    ["<leader>dr"] = { "<cmd>DapRestartFrame<CR>", "Restart Frame", silent=true },
    ["<leader>dq"] = { "<cmd>DapTerminate<CR>", "Quit Dap", silent=true },
    ["<leader>dn"] = { "<cmd>DapStepOver<CR>", "Step Over", silent=true },
    ["<leader>di"] = { "<cmd>DapStepInto<CR>", "Step Into", silent=true },
    ["<leader>do"] = { "<cmd>DapStepOut<CR>", "Step Out", silent=true },
  },
}

M.DapUI = {
  plugin = true,
  n = {

    ["<leader>ds"] = {
    function ()
      require("dapui").open()
    end,
    "Open Dap UI",
    silent = true,
    },

    ["<leader>dh"] = {
    function ()
      require("dapui").close()
    end,
    "Close Dap UI",
    silent = true,
    },

   }
}

M.ouroboros = {
  plugin = true,
  n = {
    ["<F4>"] = {"<cmd>Ouroboros<CR>", "Switch in Between Source and Header File", silent=true }
  }
}

M.nvim_move = {
  plugin = true,
  n = {
    ["<A-j>"] = { "<cmd>MoveLine(1)<CR>", "Move Line Down", silent=true },
    ["<A-k>"] = { "<cmd>MoveLine(-1)<CR>", "Move Line Up", silent=true },
    ["<A-h>"] = { "<cmd>MoveHChar(-1)<CR>", "Move Line Left", silent=true },
    ["<A-l>"] = { "<cmd>MoveHChar(1)<CR>", "Move Line Right", silent=true },
    ["<leader>wf"] = { "<cmd>MoveWord(1)<CR>", "Move Word to the right", silent=true },
    ["<leader>wb"] = { "<cmd>MoveWord(-1)<CR>", "Move Word to the left", silent=true },
  },
  v = {
    ["<A-j>"] = { ":'<'>MoveBlock(1)<CR>", "Move Line Down", silent=false },
    ["<A-k>"] = { ":'<'>MoveBlock(-1)<CR>", "Move Line Up", silent=false },
    ["<A-h>"] = { ":'<'>MoveHBlock(-1)<CR>", "Move Line Left", silent=true },
    ["<A-l>"] = { ":'<'>MoveHBlock(1)<CR>", "Move Line Right", silent=true },
  }
}

M.coderunner = {
  plugin = true,
  n = {
    ["<space>rf"] = { "<cmd> RunCode <CR>", "Run File" },
    ["<space>rp"] = { "<cmd> RunProject <CR>", "Run Project" },
  },
}

M.neogit = {
  plugin = true,
  n = {
    ["<space>ng"] = { "<cmd> Neogit cwd=%:p:h <CR>", "Open Neogit", silent = true },
  },
}

M.nvterm = {
  plugin = true,
  n = {
    ["<leader>ot"] = {
      function ()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle Horizontal term",
      opts = {noremap = true},
    },
  },
  t = {
    ["<leader>ot"] = {
      function ()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle Horizontal term",
      opts = {noremap = true},
    },
  }
}

return M

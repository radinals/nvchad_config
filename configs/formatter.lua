-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {
            "-assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
            "--style=InheritParentConfig",
            "-fallback-style=none"
          },
          stdin = true,
          try_node_modules = true,
        }
      end
    },
    c = {
      function ()
        return {
          exe = "clang-format",
          args = {
            "-assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
            "--style=InheritParentConfig",
            "-fallback-style=none"
          },
          stdin = true,
          try_node_modules = true,
        }
      end
    },
    python = {
      function ()
        return {
          exe = "autopep8",
          args = {
            "-",
            -- "--max-line-length",
            -- "80"
          },
          stdin = true,
          try_node_modules = true,
        }

      end
    }
  }
}

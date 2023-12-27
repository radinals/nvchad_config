local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- python
    "jedi-language-server",
    "autopep8",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
      file_ignore_patterns = {
        "node_modules", "png", "jpeg", "jpg",
        "bin", "mp4", "mp3", "wav", "dds", "exe",
        "tqa", "tar", "tar.gz", "tar.xz", "ogg", "zip",
        "zip", "Games", "epub", "pdf", ".cache", "dll",
        "eclipse", ".p2", ".wine", "wineprefixes",
        ".db", ".git", "ssh", ".archive", "Downloads"},
    }
  }

return M

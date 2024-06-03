require("lint").linters_by_ft = {
  cpp = {"clangtidy"},
  c = {"clangtidy"},
}

local clangtidy = require("lint" ).linters.clangtidy

clangtidy.args = {
  '--quiet',
  '-checks=performance-*'
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

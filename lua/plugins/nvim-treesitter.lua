require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

vim.cmd([[setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()]])

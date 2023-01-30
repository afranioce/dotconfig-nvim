require('lualine').setup {
  options = {
    -- theme = 'dracula'
    theme = 'catppuccin'
    -- theme = 'nord'
  },
  sections = {
    lualine_c = {'filename', 'lsp_progress'},
  },
  extensions = { 'nvim-tree', 'quickfix', 'toggleterm', 'nvim-dap-ui' },
}


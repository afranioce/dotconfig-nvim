local opt = {
  noremap = true,
  silent = true,
}

require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant",
  },
})

vim.keymap.set("n", "gb", ":BufferLinePick<CR>")
vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>", opt)
vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>", opt)
vim.keymap.set("n", "]m", ":BufferLineMoveNext<CR>", opt)
vim.keymap.set("n", "[m", ":BufferLineMovePrev<CR>", opt)
vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opt)   -- Close left tabs
vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", opt)  -- Close right tabs
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opt) -- close other tabs
vim.keymap.set("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)

vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opt)
vim.keymap.set("n", "<leader>$", ":BufferLineGoToBuffer $<CR>", opt)

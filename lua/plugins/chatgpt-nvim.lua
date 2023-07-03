require("chatgpt").setup()

vim.keymap.set("n", "<Leader>tk", "<cmd>:ChatGPT<cr>")
vim.keymap.set("n", "<Leader>tj", "<cmd>:ChatGPTActAs<cr>")
vim.keymap.set("v", "<Leader>tt", "<cmd>:ChatGPTEditWithInstructions<cr>")

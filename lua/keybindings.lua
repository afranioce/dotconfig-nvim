local opts = {noremap = true, silent = true}

-- Abbreviations -- no one is really happy until you have this shortcuts
vim.cmd [[cnoreabbrev W! w!]]
vim.cmd [[cnoreabbrev Q! q!]]
vim.cmd [[cnoreabbrev Qall! qall!]]
vim.cmd [[cnoreabbrev Wq wq]]
vim.cmd [[cnoreabbrev Wa wa]]
vim.cmd [[cnoreabbrev wQ wq]]
vim.cmd [[cnoreabbrev WQ wq]]
vim.cmd [[cnoreabbrev W w]]
vim.cmd [[cnoreabbrev Q q]]
vim.cmd [[cnoreabbrev Qall qall]]

-- Copy file paths
vim.keymap.set('n', 'cp', ':let @+=expand("%")<CR>', opts) -- relative path
vim.keymap.set('n', 'cP', ':let @+=expand("%:p")<CR>', opts) -- absolute path
vim.keymap.set('n', 'cf', ':let @+=expand("%:t")<CR>', opts) -- filename

-- Switching windows alt + hjkl
vim.keymap.set("n", "<A-h>", "<C-w>h", opts)
vim.keymap.set("n", "<A-j>", "<C-w>j", opts)
vim.keymap.set("n", "<A-k>", "<C-w>k", opts)
vim.keymap.set("n", "<A-l>", "<C-w>l", opts)

-- Close buffer
vim.keymap.set('n', '<leader>c', ':bp<bar>sp<bar>bn<bar>bd<CR>', opts)
vim.keymap.set('n', '<leader>C', ':bp<bar>sp<bar>bn<bar>bd!<CR>', opts) -- Force close

-- Clean search (highlight)
vim.keymap.set('n', '<leader><space>', ':noh<CR>', opts)

-- Save buffer
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)

-- Split screen
vim.keymap.set("n", "s", "", opts)
vim.keymap.set("n", "sv", ":vsp<CR>", opts) -- Opven vertital
vim.keymap.set("n", "sh", ":sp<CR>", opts) -- Open horizontal
vim.keymap.set("n", "sc", "<C-w>c", opts) -- Close current
vim.keymap.set("n", "so", "<C-w>o", opts) -- close others

-- Left and right proportional control
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "s,", ":vertical resize -10<CR>", opts)
vim.keymap.set("n", "s.", ":vertical resize +10<CR>", opts)

-- Up and down ratio
vim.keymap.set("n", "sj", ":resize +10<CR>", opts)
vim.keymap.set("n", "sk", ":resize -10<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)

vim.keymap.set("n", "s=", "<C-w>=", opts) -- Equal proportion

-- Spell check toggle
vim.keymap.set('n', '<leader>sc', ':set spell!<CR>', opts)

-- maintain Visual Mode after shifting > and <
vim.keymap.set('n', '<', '<<', opts)
vim.keymap.set('n', '>', '>>', opts)
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move selected text up and down
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", opts)

-- magic search https://neovim.io/doc/user/pattern.html#/\v
-- vim.keymap.set("n", "/", "/\\v", { noremap = true, silent = false })
-- vim.keymap.set("v", "/", "/\\v", { noremap = true, silent = false })

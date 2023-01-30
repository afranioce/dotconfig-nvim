vim.g.mapleader = ','

-- vim.opt.foldtext = [[v:lua.string.format("  %s: %d lines", v:lua.vim.fn.getline(v:lua.vim.v.foldstart), v:lua.vim.v.foldend - v:lua.vim.v.foldstart + 1)]]
-- vim.opt.foldenable = false
-- -- Folding settings
-- vim.opt.foldmethod = 'indent' -- fold based on indent
-- vim.opt.foldnestmax = 10 -- deepest fold is 10 levels
-- vim.opt.foldlevel = 1 -- this is just what i use
-- vim.opt.fillchars = {
--   eob = '-',
--   fold = ' ',
--   stl = '-', -- fill active window's statusline with -
--   stlnc = '_', -- also fill inactive windows
--   vert = '|' -- add a bar for vertical splits
-- }

vim.opt.updatetime = 1000

-- Softtabs
vim.opt.softtabstop = -1 -- length to use when editing text (eg. TAB and BS keys) (0 for ‘tabstop’, -1 for ‘shiftwidth’)
vim.opt.tabstop = 2 -- Length of an actual \t character
vim.opt.shiftwidth = 0 -- length to use when shifting text (eg. <<, >> and == commands)
vim.opt.shiftround = true -- round indentation to multiples of 'shiftwidth' when shifting text (so that it behaves like Ctrl-D / Ctrl-T)
vim.opt.expandtab = true -- Converts tabs into spaces
vim.opt.autoindent = true -- Reproduce the indentation of the previous line
vim.opt.smartindent = true -- try to be smart (increase the indenting level after '{', decrease it after '}', and so on)

vim.cmd [[filetype plugin indent on]]

vim.opt.hidden = true -- current buffer can be put into background
vim.opt.colorcolumn = '120' -- Display line at column width 120
vim.opt.number = true  -- Display signs in number column
-- vim.opt.cursorline = true -- Highlight the line under the cursor
vim.opt.mouse = 'a' -- Mouse support
vim.opt.spelllang = 'en_us' -- Spell check
vim.opt.spelloptions = 'camel'
vim.opt.clipboard = 'unnamedplus'
-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

--vim.opt.guifont = 'UbuntuMono Nerd Font 11'
-- File encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'

-- cmd [[hi vertsplit guifg=fg guibg=bg]]
vim.api.nvim_command [[command! Term :bot sp | term]] -- terminal split, at the bottom of the screen
vim.api.nvim_command [[command! Te :Term]] -- Term short key
vim.api.nvim_command [[autocmd TermOpen term://* startinsert]] -- automatically start insert mode when I open new terminal
vim.api.nvim_command [[hi Normal guibg=none ctermbg=none]]
vim.api.nvim_command [[hi NonText guibg=none ctermbg=none]]


vim.g.mapleader = ","
vim.g.editorconfig = true

-- vim.o.foldtext = [[v:lua.string.format("  %s: %d lines", v:lua.vim.fn.getline(v:lua.vim.v.foldstart), v:lua.vim.v.foldend - v:lua.vim.v.foldstart + 1)]]
-- Folding settings
-- vim.o.foldmethod = 'indent' -- fold based on indent
-- vim.o.foldnestmax = 10 -- deepest fold is 10 levels
-- vim.o.foldlevel = 1 -- this is just what i use
-- vim.o.fillchars = {
--   eob = '-',
--   fold = ' ',
--   stl = '-', -- fill active window's statusline with -
--   stlnc = '_', -- also fill inactive windows
--   vert = '|' -- add a bar for vertical splits
-- }

-- Softtabs
vim.o.softtabstop = -1   -- length to use when editing text (eg. TAB and BS keys) (0 for ‘tabstop’, -1 for ‘shiftwidth’)
vim.o.tabstop = 2        -- Length of an actual \t character
vim.o.shiftwidth = 0     -- length to use when shifting text (eg. <<, >> and == commands)
vim.o.shiftround = true  -- round indentation to multiples of 'shiftwidth' when shifting text (so that it behaves like Ctrl-D / Ctrl-T)
vim.o.expandtab = true   -- Converts tabs into spaces
vim.o.autoindent = true  -- Reproduce the indentation of the previous line
vim.o.smartindent = true -- try to be smart (increase the indenting level after '{', decrease it after '}', and so on)

vim.cmd([[filetype plugin indent on]])

vim.o.hidden = true       -- current buffer can be put into background
vim.o.colorcolumn = "120" -- Display line at column width 120
vim.o.number = true       -- Display signs in number column
-- o.cursorline = true -- Highlight the line under the cursor
vim.o.mouse = "a"         -- Mouse support
vim.o.spelllang = "en_us" -- Spell check
vim.o.spelloptions = "camel"
vim.o.clipboard = "unnamedplus"

-- Searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- vim.o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

vim.o.guifont = "UbuntuMono Nerd Font 11"
-- File encoding
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"

local is_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil

if is_wsl then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = false,
  }
end

-- disable line numbering in terminal mode
local vim_term = vim.api.nvim_create_augroup('vim_term', { clear = true })
vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter' }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end,
  group = vim_term
})
-- -- start insert mode when moving to a terminal window
-- vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter' }, {
--   callback = function()
--     if vim.bo.buftype == 'terminal' then vim.cmd('startinsert') end
--   end,
--   group = vim_term
-- })
-- -- prevents insert mode when the terminal process has exited
-- vim.api.nvim_create_autocmd('TermClose', {
--   callback = function(ctx)
--     vim.cmd('stopinsert')
--     vim.api.nvim_create_autocmd('TermEnter', {
--       command = 'stopinsert',
--       buffer = ctx.buf,
--     })
--   end,
--   nested = true,
--   group = vim_term
-- })

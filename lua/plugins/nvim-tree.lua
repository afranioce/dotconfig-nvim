local utils = require "nvim-tree.utils"
local core = require "nvim-tree.core"

local function live_grep_in(node)
    if not node then
        return
    end

    local absolute_path = node.absolute_path
    local relative_path = utils.path_relative(absolute_path, core.get_cwd())

    local path = absolute_path
    if node.type ~= "directory" and node.parent then
        path = node.parent.absolute_path
    end

    require("telescope.builtin").live_grep({
        search_dirs = { path },
        prompt_title = string.format("Live Grep in [%s]", relative_path),
    })
end

require("nvim-tree").setup({
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    diagnostics = {
        enable = true,
    },
    git = {
        enable = true,
        ignore = true,
    },
    open_on_setup = false,          -- TODO: Deprecated setup should be removed in the future
    open_on_setup_file = false,     -- TODO: Deprecated setup should be removed in the future
    ignore_buffer_on_setup = false, -- TODO: Deprecated setup should be removed in the future
    ignore_ft_on_setup = {},        -- TODO: Deprecated setup should be removed in the future
    view = {
        side = "left",
        width = 60,
        mappings = {
            list = {
                { key = '<C-f>', action = '', action_cb = live_grep_in, mode = 'n' },
            },
        },
    },
    filters = {
        dotfiles = true,
        custom = {
            "\\.git$",
            "\\.idea$",
            "\\.vscode$",
            "\\.history$",
        },
    },
    renderer = {
        highlight_opened_files = "name",
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
                modified = true,
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

local function open_nvim_tree(data)
    local IGNORED_FT = {
        "dashboard",
        "gitcommit",
    }

    -- buffer is a real file on the disk
    local is_real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    -- &ft
    local filetype = vim.bo[data.buf].ft

    -- only files please
    if not is_real_file and not no_name then
        return
    end

    -- skip ignored filetypes
    if vim.tbl_contains(IGNORED_FT, filetype) then
        return
    end

    -- open the tree but don't focus it
    require("nvim-tree.api").tree.toggle({ focus = false })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local opts = { noremap = true, silent = false }

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<Cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<Cr>", opts)

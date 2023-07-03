require("lualine").setup({
    options = {
        -- theme = 'dracula'
        theme = "catppuccin",
        -- theme = 'nord'
    },
    globalstatus = true,
    sections = {
        lualine_b = {
            {
                "branch",
                filetype_names = {
                    TelescopePrompt = "Telescope",
                    dashboard = "Dashboard",
                    packer = "Packer",
                },
                fmt = function(str)
                    if vim.api.nvim_strwidth(str) > 40 then
                        return ("%s…"):format(str:sub(1, 39))
                    end

                    return str
                end,
            },
            "diff",
            "diagnostics",
        },
        lualine_c = {
            require("auto-session.lib").current_session_name,
            function()
                if #vim.lsp.buf_get_clients() > 0 then
                    return require("lsp-status").status()
                end

                return ""
            end,
        },
    },
    extensions = { "nvim-tree", "quickfix", "toggleterm", "nvim-dap-ui" },
})

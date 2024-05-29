local utils = require("nvim-tree.utils")
local core = require("nvim-tree.core")

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

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<C-f>", function()
		local node = api.tree.get_node_under_cursor()
		live_grep_in(node)
	end, opts("Live Grep in Node Path"))
end

require("nvim-tree").setup({
	on_attach = on_attach,
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
	view = {
		side = "left",
		width = 40,
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

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
			vim.cmd("quit")
		end
	end,
})

local opts = { noremap = true, silent = false }

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<Cr>", opts)
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<Cr>", opts)

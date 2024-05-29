local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- null_ls.builtins.hover.dictionary, -- hover isn't working https://github.com/neovim/neovim/issues/12587
    -- null_ls.builtins.completion.spell,
    -- null_ls.builtins.code_actions.shellcheck,
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.hadolint,
    -- null_ls.builtins.diagnostics.php,
    null_ls.builtins.diagnostics.vale,
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.terraform_validate,
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.terraform_fmt,
  },
})

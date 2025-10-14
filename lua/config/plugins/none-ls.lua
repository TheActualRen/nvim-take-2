return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = function(params)
                        -- Prefer project `.clang-format` if it exists
                        local config_file = vim.fn.findfile(".clang-format", params.root .. ";")
                        if config_file ~= "" then
                            return { "--style=file" }
                        end
                        return {
                            "--style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100, BreakBeforeBraces: Allman, PointerAlignment: Right}"
                        }
                    end,
                }),
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format File" })
    end,
}

return {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
        -- Vimtex settings
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_forward_search_on_start = false
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_quickfix_mode = 1
        vim.g.vimtex_mappings_enabled = 1 -- we can also override/add mappings

        -- Plugin-local keymaps
        local opts = { buffer = true, desc = "" }

        -- Compile the current document
        vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>",
            vim.tbl_extend("force", opts, { desc = "Vimtex compile" }))

        -- View PDF
        vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>",
            vim.tbl_extend("force", opts, { desc = "Vimtex view PDF" }))

        -- Stop compilation
        vim.keymap.set("n", "<leader>le", "<cmd>VimtexStop<CR>",
            vim.tbl_extend("force", opts, { desc = "Vimtex stop compile" }))

        -- Toggle quickfix
        vim.keymap.set("n", "<leader>lq", "<cmd>VimtexErrors<CR>",
            vim.tbl_extend("force", opts, { desc = "Vimtex errors" }))
    end,
}

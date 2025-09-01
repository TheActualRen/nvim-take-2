return {
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                    "html",
                    "cssls",
                    "ts_ls",
                },

                automatic_installation = false,
                automatic_setup = false,
                automatic_enable = false,
                handlers = nil,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            local servers = {
                "lua_ls",
                "clangd",
                "pyright",
                "html",
                "cssls",
                "ts_ls",
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end


            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to Definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
        end,
    }
}

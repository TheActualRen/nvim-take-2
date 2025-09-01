return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
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
                automatic_installation = false, -- safer for newer Neovim versions
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local servers = { "lua_ls", "clangd", "pyright", "html", "cssls", "ts_ls" }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- Prevent duplicate clangd clients
                        if server == "clangd" then
                            for _, other_client in pairs(vim.lsp.get_active_clients()) do
                                if other_client.name == "clangd" and other_client.id ~= client.id then
                                    client.stop()
                                end
                            end
                        end

                        -- Buffer-local keymaps
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
                    end,
                })
            end
        end,
    },
}


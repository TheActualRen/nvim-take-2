return {
    "mason-org/mason-lspconfig.nvim",

    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        { "saghen/blink.cmp" },
    },

    opts = {
        ensure_installed = {
            "clangd",
            "basedpyright",
        },

        automatic_installation = true,

        servers = {
            clangd = {},
            basedpyright = {},
        },
    },

    setup_servers = function(opts)
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        for server, server_opts in pairs(opts.servers) do
            server_opts.capabilities = capabilities
            lspconfig[server].setup(server_opts)
        end
    end,

    config = function(_, opts)
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = opts.ensure_installed,
            automatic_installation = opts.automatic_installation,
        })

        require("config.plugins.mason-lsp").setup_servers(opts)
    end,
}


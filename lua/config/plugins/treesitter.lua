return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",

    config = function()
        ensure_installed = {
            lua,
            c,
            python
        }
    end,
}

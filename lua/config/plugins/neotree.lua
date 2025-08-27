return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },

    config = function() 
        -- Open Neotree
        vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Open filetree" })

        -- Window Navigation with ctrl + h and ctrl + l
        vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
        vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
  end,
}

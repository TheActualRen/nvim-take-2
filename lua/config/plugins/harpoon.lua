return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local harpoon = require("harpoon")

            harpoon:setup({
                global_settings = {
                    save_on_toggle = true,
                    save_on_change = true,
                },
            })

            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}

                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set(
                "n", "<M-f>",
                function()
                    toggle_telescope(harpoon:list())
                end,
                { desc = "Harpoon Telescope" }
            )

            vim.keymap.set(
                "n", "<M-a>",
                function()
                    harpoon:list():add()
                end,
                { desc = "Harpoon Add" }
            )

            vim.keymap.set(
                "n", "<M-e>",
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                { desc = "Harpoon Quick Menu"}
            )


            vim.keymap.set(
                "n", "<M-1>",
                function()
                    harpoon:list():select(1)
                end,
                { desc = "Harpoon Buffer 1" }
            )

            vim.keymap.set(
                "n", "<M-2>",
                function()
                    harpoon:list():select(2)
                end,
                { desc = "Harpoon Buffer 2" }
            )

            vim.keymap.set(
                "n", "<M-3>",
                function()
                    harpoon:list():select(3)
                end,
                { desc = "Harpoon Buffer 3" }
            )

            vim.keymap.set(
                "n", "<M-4>",
                function()
                    harpoon:list():select(4)
                end,
                { desc = "Harpoon Buffer 4" }
            )

            vim.keymap.set(
                "n", "<M-p>",
                function()
                    harpoon:list():prev()
                end,
                { desc = "Harpoon Buffer Previous" }
            )

            vim.keymap.set(
                "n", "<M-n>",
                function()
                    harpoon:list():next()
                end,
                { desc = "Harpoon Buffer Next" }
            )

        end,

	},

}

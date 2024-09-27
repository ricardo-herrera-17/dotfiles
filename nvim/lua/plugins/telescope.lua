return {
    "nvim-telescope/telescope.nvim",
    opts = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.97,
                    width = 0.93,
                    preview_height = 0.75
                },
            },
            pickers = {
                find_files = {
                    hidden = false,
                },
            },
        })
    end,
}

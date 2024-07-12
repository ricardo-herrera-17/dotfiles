return {
    "nvim-telescope/telescope.nvim",
    opts = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.95,
                    width = 0.9
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })
    end,
}

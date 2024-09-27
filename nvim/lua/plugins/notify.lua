return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            timeout = 10000,
            top_down = false,
            position = "bottom_right",
        })
    end,
}

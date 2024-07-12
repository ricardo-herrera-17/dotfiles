return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
        timeout = 10000,
    })
  end,
}

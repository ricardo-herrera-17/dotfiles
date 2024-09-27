return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function ()
    vim.keymap.set('n', '<leader>E', ':Neotree filesystem reveal left<CR>', { noremap = true, silent = true})
    require("neo-tree").setup({
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          ["<C-k>"] = { "scroll_preview", config = {direction = 10} },
          ["<C-j>"] = { "scroll_preview", config = {direction = -10} },
        }
      },
      filesystem = {
          filtered_items = {
              visible = true,
              hide_dotfiles = false,
          },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd([[setlocal relativenumber]])
          end,
        },
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end
        },
      },
    })
  end
}

-- ~/.config/nvim/lua/plugins/devicons.lua
return {
  "nvim-tree/nvim-web-devicons",
  lazy = true, -- loads automatically when needed
  config = function()
    require("nvim-web-devicons").setup({
      override_by_extension = {
        ["myext"] = {
          icon = "",
          color = "#6d8086",
          name = "MyExt",
        },
      },
    })
  end,
}

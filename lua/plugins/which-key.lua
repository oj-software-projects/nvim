return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>b", group = "Buffer", icon = "󰓩 " },
      { "<leader>c", group = "Code", icon = " " },
      { "<leader>d", group = "Diagnostics/Debug", icon = " " },
      { "<leader>f", group = "File/Find", icon = "󰈞 " },
      { "<leader>g", group = "Git", icon = "󰊢 " },
      { "<leader>m", group = "Method/Move", icon = "󱗘 " },
      { "<leader>p", group = "Project", icon = "󱗖 " },
      { "<leader>q", group = "Quit/Session", icon = "󰗼 " },
      { "<leader>s", group = "Search", icon = " " },
      { "<leader>u", group = "UI/Util", icon = "󰙵 " },
      { "<leader>w", group = "Window", icon = "󱂬 " },
      { "<leader>x", group = "Diagnostics", icon = "󱖫 " },
      { "<leader>z", group = "Zen Mode", icon = "󰉖 " },
      { "<leader><tab>", group = "Tabs", icon = "󰓩 " },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}

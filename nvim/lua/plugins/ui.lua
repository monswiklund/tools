return {
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  
  -- Animation (Opt-in: set enabled = true to activate)
  {
    "echasnovski/mini.animate",
    enabled = false, 
    event = "VeryLazy",
    opts = function()
      -- Conservative settings if enabled
      local animate = require("mini.animate")
      return {
        resize = { enable = false },
        open = { enable = false },
        close = { enable = false },
        scroll = { 
          timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        },
      }
    end,
  },
}

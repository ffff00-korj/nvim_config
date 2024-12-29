local opts = {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
      ["<Enter>"] = { "accept" },
      ["<C-n>"] = { "scroll_documentation_down" },
      ["<C-p>"] = { "scroll_documentation_up" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    signature = { enabled = true },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
      ghost_text = { enabled = true },
    },
  },
}

return opts

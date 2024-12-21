local opts = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dapui = require("dapui")
    dapui.setup({
      layouts = {
        {
          elements = {
            "watches",
            "scopes",
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
          },
          size = 0.25,
          position = "bottom",
        },
      },
    })

    vim.keymap.set("n", "<leader>Du", function()
      dapui.toggle()
    end, {
      desc = "Toggle [D]ebug [u]I",
    })
    vim.keymap.set({ "n", "v" }, "<leader>Dk", function()
      dapui.eval()
    end, {
      desc = "Evaluate debug expression",
    })
    vim.keymap.set("n", "<leader>Dts", function()
      dapui.float_element("stacks", { enter = true })
    end, {
      desc = "[D]ebug [t]oggle [s]tacks",
    })
    vim.keymap.set("n", "<leader>Dtb", function()
      dapui.float_element("breakpoints", { enter = true })
    end, {
      desc = "[D]ebug [t]oggle [b]reakpoints",
    })
    vim.keymap.set("n", "<leader>Dtw", function()
      dapui.float_element("watches", { enter = true })
    end, {
      desc = "[D]ebug [t]oggle [w]atches",
    })
    vim.keymap.set("n", "<leader>Dtl", function()
      dapui.float_element("", { enter = true })
    end, {
      desc = "[D]ebug [t]oggle [l]ist",
    })
  end,
}

return opts

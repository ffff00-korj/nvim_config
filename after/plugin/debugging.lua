require("dap-python").setup()
require("dapui").setup()

vim.keymap.set("n", "<F1>", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<F2>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F3>", ":DapStepInto<CR>")
vim.keymap.set("n", "<F4>", ":DapStepOut<CR>")
vim.keymap.set("n", "<F5>", ":DapContinue<CR>")

vim.keymap.set("n", "<F10>", ":lua require('dapui').toggle()<CR>")

local dap = require('dap')

table.insert(dap.configurations.python, {
    name = 'Django',
    type = 'python',
    request = 'launch',
    stopOnEntry = false,
    program = '${workspaceFolder}/manage.py',
    args = {
        "runserver",
        "--no-color",
        "--noreload",
    },
    debugOptions = {
        "RedirectOutput",
        "DjangoDebugging"
    }
})

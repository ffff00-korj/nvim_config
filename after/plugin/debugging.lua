require("dap-python").setup()
require("dapui").setup()

vim.keymap.set("n", "<F1>", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<F2>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F3>", ":DapStepInto<CR>")
vim.keymap.set("n", "<F4>", ":DapStepOut<CR>")
vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
vim.keymap.set("n", "<F10>", ":lua require('dapui').toggle()<CR>")

-- only for python
vim.keymap.set("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>df", ":lua require('dap-python').test_class()<CR>")

local dap, dapui = require('dap'), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

table.insert(dap.configurations.python, {
    name = 'Django',
    type = 'python',
    request = 'launch',
    stopOnEntry = false,
    program = function()
        return vim.fn.getcwd() .. '/' .. vim.fn.input('Django project name: ') .. '/manage.py'
    end,
    cwd = '${workspaceFolder}',
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

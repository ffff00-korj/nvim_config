local debug_configurations = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}"
    },
}

return debug_configurations

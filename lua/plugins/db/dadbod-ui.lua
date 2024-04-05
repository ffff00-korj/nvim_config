local options = {
    "kristijanhusak/vim-dadbod-ui",
    lazy = true,
    cmd = { "DB", "DBUI" },
    ft = { "sql", "mysql", "plsql" },
    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
    },
}

return options

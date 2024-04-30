local options = {
    "doums/dark.nvim",
    lazy = false,
    config = function()
        -- setup colorscheme
        vim.cmd('colorscheme dark')
        -- transparent background
        vim.cmd("hi Normal ctermbg=none guibg=none")
        -- vim cmd bakground fix
        vim.cmd("hi Pmenu guibg=none guifg=none")       -- menu
        vim.cmd("hi FloatBorder guibg=none guifg=none") -- signature
        -- custom git signs
        vim.cmd("hi clear SignColumn")
        vim.cmd("hi DiffAdd guibg=none guifg=#26A269")
        vim.cmd("hi DiffChange guibg=none guifg=#61AFEF")
        vim.cmd("hi DiffDelete guibg=none guifg=#E06C75")
        vim.cmd("hi DiffText guibg=none guifg=gray")
        -- change line number font folor
        vim.cmd("hi LineNr guifg=#797979")
        -- dapui colors. get colors from https://github.com/doums/dark.nvim/blob/main/lua/dark/palette.lua
        vim.cmd("hi DapUIScope guifg=#20999D") -- type
        vim.cmd("hi DapUIType guifg=#CF8E6D") -- keyword
        vim.cmd("hi DapUIValue guifg=gray")
        vim.cmd("hi DapUIVariable guifg=gray")
        vim.cmd("hi DapUIModifiedValue guifg=gray")
        vim.cmd("hi DapUIDecoration guifg=gray")
        vim.cmd("hi DapUIThread guifg=gray")
        vim.cmd("hi DapUIStoppedThread guifg=gray")
        vim.cmd("hi DapUISource guifg=gray")
        vim.cmd("hi DapUILineNumber  guifg=#797979") -- from LineNr highlight
        vim.cmd("hi DapUIFloatBorder guifg=none") -- standart border from cmp
        vim.cmd("hi DapUIWatchesEmpty guifg=gray")
        vim.cmd("hi DapUIWatchesValue guifg=gray")
        vim.cmd("hi DapUIWatchesError guifg=#F75464") -- error
        vim.cmd("hi DapUIBreakpointsPath guifg=gray")
        vim.cmd("hi DapUIBreakpointsInfo guifg=gray")
        vim.cmd("hi DapUIBreakpointsCurrentLine guifg=gray")
        vim.cmd("hi DapUIBreakpointsDisabledLine  guifg=gray")
        vim.cmd("hi DapUIStepOver guifg=gray")
        vim.cmd("hi DapUIStepInto guifg=gray")
        vim.cmd("hi DapUIStepBack guifg=gray")
        vim.cmd("hi DapUIStepOut guifg=gray")
        vim.cmd("hi DapUIStop guifg=gray")
        vim.cmd("hi DapUIPlayPause guifg=gray")
        vim.cmd("hi DapUIRestart guifg=gray")
        vim.cmd("hi DapUIUnavailable guifg=gray")
        vim.cmd("hi DapUIWinSelect guifg=gray")
    end
}

return options

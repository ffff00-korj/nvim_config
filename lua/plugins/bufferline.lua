return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        { '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>' },
        { '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>' },
        { '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>' },
        { '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>' },
        { '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>' },
        { '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>' },
        { '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>' },
        { '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>' },
        { '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>' },
        { '<A-$>', '<Cmd>BufferLineGoToBuffer -1<CR>' },
        { '<A-,>', '<Cmd>BufferLineCyclePrev<CR>' },
        { '<A-.>', '<Cmd>BufferLineCycleNext<CR>' },
        { '<A-<>', '<Cmd>BufferLineMovePrev<CR>' },
        { '<A->>', '<Cmd>BufferLineMoveNext<CR>' },
    },
    config = function()
        local colors = {
            fg = "#76787d",
            bg = "#252829",
        }
        require("bufferline").setup({
            options = {
                indicator = {
                    icon = " ",
                },
                show_close_icon = false,
                tab_size = 1,
                max_name_length = 25,
                -- offsets = {
                --     {
                --         filetype = "neo-tree",
                --         text = "  Project",
                --         highlight = "Directory",
                --         text_align = "left",
                --     },
                -- },
                -- modified_icon = "",
                custom_areas = {
                    left = function()
                        return {
                            { text = "    ", fg = colors.fg },
                        }
                    end,
                },
            },
            highlights = {
                fill = {
                    bg = "",
                },
                background = {
                    bg = "",
                },
                tab = {
                    bg = "",
                },
                tab_close = {
                    bg = "",
                },
                tab_separator = {
                    fg = colors.bg,
                    bg = "",
                },
                tab_separator_selected = {
                    fg = colors.bg,
                    bg = "",
                    sp = colors.fg,
                },
                close_button = {
                    bg = "",
                    fg = colors.fg,
                },
                close_button_visible = {
                    bg = "",
                    fg = colors.fg,
                },
                close_button_selected = {
                    fg = { attribute = "fg", highlight = "StatusLineNonText" },
                },
                buffer_visible = {
                    bg = "",
                },
                modified = {
                    bg = "",
                },
                modified_visible = {
                    bg = "",
                },
                duplicate = {
                    fg = colors.fg,
                    bg = "",
                },
                duplicate_visible = {
                    fg = colors.fg,
                    bg = "",
                },
                separator = {
                    fg = colors.bg,
                    bg = "",
                },
                separator_selected = {
                    fg = colors.bg,
                    bg = "",
                },
                separator_visible = {
                    fg = colors.bg,
                    bg = "",
                },
                offset_separator = {
                    fg = colors.bg,
                    bg = "",
                },

                -- indicator_visible = {
                --   fg = colors.fg,
                --   bg = colors.bg
                -- },
                -- indicator_selected = {
                --   fg = colors.fg,
                --   bg = colors.bg
                -- },
            },
        })
    end,
}

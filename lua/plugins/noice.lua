return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        -- UI-Presets
        presets = {
            command_palette = true, -- neue Eingabeleiste zentriert
            long_message_to_split = true, -- lange Ausgaben → automatisch in Split
            inc_rename = false,
            lsp_doc_border = true, -- Rahmen um LSP-Hover & SignatureHelp
        },

        -- LSP-Dinge verbessern
        lsp = {
            progress = { enabled = true },
            hover = { enabled = true },
            signature = { enabled = true },
            message = { enabled = true },
        },

        -- Nachrichtensteuerung
        messages = {
            enabled = true,
            view = "mini", -- kleine Popups statt unterer Cmdline
        },

        -- Cmdline fancy machen
        cmdline = {
            enabled = true,
            view = "cmdline_popup",
            format = {
                search_down = { icon = "🔍 " },
                search_up = { icon = "🔍 " },
            },
        },

        -- Routing optional erweitern
        routes = {
            -- Filtere bestimmte wiederkehrende "noisy" Meldungen raus
            {
                filter = {
                    event = "msg_show",
                    find = "written",
                },
                opts = { skip = true },
            },
        },
    },
}

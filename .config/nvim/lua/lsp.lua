-- nvim-lspconfig
local nvim_lsp = require('lspconfig')

-- lsp-status.nvim
local lsp_status = require('lsp-status')
lsp_status.register_progress()

-- nvim-lightbulb
vim.fn.sign_define("LightBulbSign", { text = "󱉵", texthl = "LspDiagnosticsSignWarning" })
vim.cmd (
    [[ autocmd CursorHold,CursorHoldI * lua LightBulbFunc() ]]
)
LightBulbFunc = function()
    require("nvim-lightbulb").update_lightbulb {
        sign = { enabled = true },
        virtual_text = { enabled = false, text = "󱉵 ", column = -1, text_pos = "overlay"},
        float = { enabled = false, text = "󱉵 "},
    }
end

-- nvim-telescope
local telescope = function(picker)
    return string.format("<cmd> lua require('telescope.builtin').%s()<CR>", picker)
end

-- lsp keybinds
local on_attach = function(_)
    local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
    local mapper = function(mode, key, result)
        vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
    end

    -- Information and search
    mapper('n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>')
    mapper('n', 'gd',        '<cmd>lua vim.lsp.buf.declaration()<CR>')
    mapper('n', 'gD',        '<cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', 'gr',        telescope('lsp_references'))
    mapper('n', 'gw',        telescope('lsp_document_symbols'))

    -- Actions
    mapper('n', 'ga',        telescope('lsp_code_actions'))
    mapper('n', 'gf',        '<cmd>lua vim.lsp.buf.formatting()<CR>')
    mapper('n', 'gR',        '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- Diagnostics
    mapper('n', '<leader>d',     '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    mapper('n', '<leader>d]',    '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    mapper('n', '<leader>d[',    '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

    -- Rust specific stuff
    if filetype == 'rust' then
        -- Auto format files
        vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
    end
end

-- Setup LSP servers
nvim_lsp.clangd.setup{on_attach = on_attach, capabilities = lsp_cap}
nvim_lsp.pyright.setup{
    cmd = { "pyright-langserver", "--stdio" },
    on_attach = on_attach, capabilities = lsp_cap,
}

local efm = {
    flake8 = {
        lintCommand = "flake8 --stdin-display-name ${INPUT} -",
        lintIgnoreExitCode = true,
        lintStdin = true,
        lintFormats = { "%f:%l:%c: %m" },
        rootMarkers = { "setup.cfg", "tox.ini", ".flake8" },
    },
    shellcheck = {
        lintCommand = "shellcheck -f gcc -x",
        lintStdin = true,
        lintFormats = "%f:%l:%c: %t%*[^:]: %m [SC%n]",
    }
}
nvim_lsp.efm.setup {
    settings = {
        lintDebounce = 1000000000,
        languages = {
            python = { efm.flake8 },
            sh = { efm.shellcheck },
        }
    }
}

-- treesitter
local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "dockerfile",
        "java",
        "json",
        "latex",
        "lua",
        "python",
        "regex",
        "toml",
        "yaml",
        "typescript",
        "html",
        "css",
        "rust"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}

-- Diagnostics
vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsSignWarning" })
vim.fn.sign_define(
    "LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsSignInformation" }
)
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsSignHint" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

require('rust-tools').setup({
    server = {
        on_attach=on_attach,
        settings = {
            ['rust-analyzer'] = {
                cargo = { allFeatures = true, autoReload = true },
                checkOnSave = {
                    enable = true, command = "clippy",
                },
                hoverActions = {
                    linksInHover = false 
                }
            }
        }
    }
})

local opts = {
    tools = { -- rust-tools options
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,

        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler 
        hover_with_actions = true,

        runnables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        debuggables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",

            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = true,

            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            auto_focus = false
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
        server = {
        on_attach=on_attach,
        settings = {
            ['rust-analyzer'] = {
                cargo = { allFeatures = true, autoReload = true },
                checkOnSave = {
                    enable = true, command = "clippy",
                },
                hoverActions = {
                    linksInHover = false 
                }
            }
        }
    },

    -- debugging stuff
    dap = {
        adapter = {
            type = 'executable',
            command = 'lldb-vscode',
            name = "rt_lldb"
        }
    }
}

require('rust-tools').setup(opts)


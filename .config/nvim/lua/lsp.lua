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
end

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
        "css"
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


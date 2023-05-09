local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {'c', 'cpp', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim'},

    highlight = {
        enable = true
    },
    indent = {
        enable = true,
        disable = {'python'}
    },

    autopairs = {
        enable = true
    }
})

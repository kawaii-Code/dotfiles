local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = {'c','lua'},
    sync_install = false,
    auto_install = true,
    -- Fuck js
    ignore_install = {'javascript'},
    highlight = {
        enable = true,
        disable = function(language, buffer)
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buffer))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    modules = {},
})

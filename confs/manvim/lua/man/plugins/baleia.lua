-- This configuration is based on the standard setup from the baleia.nvim documentation.

-- 1. Setup the plugin and store the instance globally.
vim.g.baleia = require("baleia").setup({
    -- Ensure codes are rendered, not stripped.
    strip_ansi_codes = true,
    -- Set log level to debug to help if issues persist.
    log = "DEBUG",
})

-- 2. Create an autocmd to run the colorizing function automatically for man pages.
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*", -- Match all buffers entering a window
    callback = function()
        -- Only run this for 'man' filetypes
        if vim.bo.filetype == 'man' then
            -- This is the same function the :BaleiaColorize command uses.
            -- We know this works from our manual test.
            vim.g.baleia.once(vim.api.nvim_get_current_buf())

            -- After processing, ensure the buffer is not considered "modified"
            -- so that :q and ZZ work as expected.
            vim.api.nvim_set_option_value("modified", false, { buf = 0 })
        end
    end,
})

-- 3. (Optional) Create the user commands for manual use, just like in the docs.
vim.api.nvim_create_user_command("BaleiaColorize", function()
    vim.g.baleia.once(vim.api.nvim_get_current_buf())
end, { bang = true })

vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })

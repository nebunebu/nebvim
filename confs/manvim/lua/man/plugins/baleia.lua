local baleia = require("baleia").setup({
  strip_ansi_codes = true,
  line_starts_at = 0, -- helps when ESC appears in col 0
  log = "WARN",
})

vim.g.baleia_instance = baleia

vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local was_modifiable = vim.api.nvim_get_option_value("modifiable", { buf = buf })

    if not was_modifiable then
      vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
    end

    -- Process existing content once
    baleia.once(buf)

    -- If you expect more lines to be appended (e.g., streaming into the buffer):
    -- baleia.automatically(buf)

    -- restore flags cleanly
    vim.api.nvim_set_option_value("modified", false, { buf = buf })
    if not was_modifiable then
      vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
    end
  end,
})

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth", -- Run this the first time to authenticate
  event = "InsertEnter",   -- Loads when you begin to type
  config = function()
    require("copilot"). setup({
      suggestion = {
        enabled = true,            -- Enable inline suggestions
        auto_trigger = true,       -- Trigger suggestions as you type
        debounce = 100,
        keymap = {
          accept = "<leader>ca",        -- Customize your accept key
          next = "<leader>cn",          -- Next suggestion
          prev = "<leader>cp",          -- Previous suggestion
          dismiss = "<leader>cd",       -- Dismiss suggestion
        },
      },
      panel = { enabled = false }, -- Disable the Copilot panel if preferred
      filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ["."] = false, -- Disable for files with no extension
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%. env.*') then
            -- Disable for .env files
            return false
          end
          return true
        end,
      },
    })
  end,
}

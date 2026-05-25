local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("vim-config")
require("lazy").setup("plugins", {
  git = {
    url_format = "git@github.com:%s.git",
  },
  change_detections = {
    notify = true,
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "copilot" then
      -- Handle Copilot LSP status notifications
      client.handlers["$/progress"] = function(err, result, ctx)
        -- Silently handle progress notifications
        return vim.NIL
      end

      client.handlers["copilot/statusNotification"] = function(err, result, ctx)
        -- Handle Copilot status notifications (optional: show in notifications)
        -- if result and result.status then
        --   vim.notify("Copilot: " .. result.status, vim.log.levels.INFO)
        -- end
        return vim.NIL
      end
    end
  end,
})


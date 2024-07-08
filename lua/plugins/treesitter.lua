return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "elixir", "heex", "rust", "zig", "gleam", "javascript"},
      sync_install = false,
      highlight = { enable = true},
      indent = { enable = true}
    })
  end
}

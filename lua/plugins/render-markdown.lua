return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  keys = {
    { "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown Preview" },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

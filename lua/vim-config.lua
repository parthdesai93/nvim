vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu")
vim.cmd("set nu")

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- copy and cut visual selection to system clipboard
vim.keymap.set("v", "<leader>x", [["+d]])

vim.g.mapleader = " "

-- LSP server settings (native vim.lsp.config, Neovim 0.11+)
local mason_bin = vim.fn.expand("~/.local/share/nvim/mason/bin")

vim.lsp.config("lua_ls", {
  cmd = { mason_bin .. "/lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.config("nextls", {
  cmd = { mason_bin .. "/nextls", "--stdio" },
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  root_markers = { "mix.exs", ".git" },
  init_options = {
    experimental = {
      completions = { enable = true },
    },
    mix_env = "dev",
    mix_target = "host",
    fetch_deps = false,
  },
  cmd_env = {
    NEXTLS_SPITFIRE_ENABLED = "1",
    NEXTLS_LOCAL_RUNTIME_ENABLED = "1",
  },
})

vim.lsp.config("ts_ls", {
  cmd = { mason_bin .. "/typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})

vim.lsp.config("graphql", {
  cmd = { mason_bin .. "/graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql" },
  root_markers = { ".graphqlrc", ".graphqlrc.yml", ".graphqlrc.yaml", ".graphqlrc.json", "graphql.config.js", "graphql.config.ts", ".git" },
})

vim.lsp.config("helm_ls", {
  cmd = { mason_bin .. "/helm_ls", "serve" },
  filetypes = { "helm" },
  root_markers = { "Chart.yaml", ".git" },
})

vim.lsp.enable({ "lua_ls", "nextls", "ts_ls", "graphql", "helm_ls" })

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

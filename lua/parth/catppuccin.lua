require('catppuccin').setup({
    flavour = 'frappe',
    background = {
        light = 'latte',
        dark = 'frappe'
    },
    integrations = {
        neotree = true,
        nvimtree = true,
        treesitter = true,
        cmp = true,
        mason = true,
        telescope = {
            enabled = true,
            style = 'nvchad'
        }
    }
})

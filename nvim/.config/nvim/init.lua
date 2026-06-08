-- Options
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.scrolloff = 15
vim.opt.winborder = "rounded"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.statusline = "%f %m %= %y %l/%L Col %c"
vim.opt.colorcolumn = "80"
vim.opt.pumheight = 5
vim.opt.pumborder = "rounded"
vim.opt.autocomplete = true
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Keymap
vim.keymap.set("n", "<leader>i", function()
    vim.cmd("normal! mzgg=G`z")
end)

vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>c", '"+yy')
vim.keymap.set("v", "<leader>c", '"+y')
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>i", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>n", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>c", ":cd %:p:h<CR>")
vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", { noremap = true, expr = true })
vim.keymap.set("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", { noremap = true, expr = true })
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })

-- Plugins
vim.pack.add({
    { src = "https://github.com/windwp/nvim-autopairs" },
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = "harpoon2"
    },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    {
        src = "https://github.com/catppuccin/nvim",
        name = "catppuccin"
    },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/m4xshen/hardtime.nvim" },
})

require("nvim-autopairs").setup()

local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

require("catppuccin").setup({
    transparent_background = true,
})
vim.cmd.colorscheme "catppuccin-frappe"

require("hardtime").setup()

-- LSP
require("mason").setup()
require("mason-lspconfig").setup()

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.opt.complete:append("o")
vim.opt.completeopt = { "menuone", "noselect" }

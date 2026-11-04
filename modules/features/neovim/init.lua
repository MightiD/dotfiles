vim.g.mapleader = " "

-- shared behaviors
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>c", '"+yy')
vim.keymap.set("v", "<leader>c", '"+y')
vim.keymap.set("n", "<leader>n", ":nohlsearch<CR>")


if vim.g.vscode then
    -- VSCode extension
    local vscode = require("vscode")
    vim.keymap.set("n", "za", function() vscode.action("editor.toggleFold") end)
    vim.keymap.set("n", "<leader>e", function() vscode.action("workbench.view.explorer") end)
else
    -- Regular Neovim
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.wrap = true
    vim.opt.swapfile = false
    vim.opt.scrolloff = 15
    vim.opt.winborder = "rounded"
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.laststatus = 2
    vim.opt.statusline = "%f %m %= %y %l/%L Col %c"
    vim.opt.colorcolumn = "80"
    vim.opt.pumheight = 5
    vim.opt.pumborder = "rounded"
    vim.opt.autocomplete = true
    vim.opt.wildmenu = true
    vim.opt.wildmode = "longest:full,full"

    require("vim._core.ui2").enable({})

    vim.keymap.set("n", "<leader>e", ":Ex<CR>")

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
    })

    require("nvim-autopairs").setup()

    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    require("catppuccin").setup({
        transparent_background = true,
    })
    vim.cmd.colorscheme "catppuccin-frappe"

end
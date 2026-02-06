require("natlogINIT.init")
require("config.lazy")

require("plugins.lsp")
require("plugins.cmp")
require("plugins.mini")
require("plugins.btw")

vim.keymap.set({"n", "v"}, "y", '"+y"')
vim.keymap.set({"n", "v"}, "p", '"+p"')

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10

vim.opt.tabstop = 4 -- # spaces <Tab>
vim.opt.shiftwidth = 4 -- # spaces autoindent
vim.opt.softtabstop = 4 -- tab inserts 4 spaces
vim.opt.expandtab = true -- use spaces isntead of tabs
vim.opt.smarttab = true -- tab respeq shftwdth at line start
vim.opt.autoindent = true -- copy indent from current line
vim.opt.smartindent = true -- smart auto indenting


vim.api.nvim_create_autocmd("BufEnter", {
    callback = function() 
        local file = vim.fn.expand("%:p")
        if vim.fn.filereadable(file) == 1 then
            vim.cmd("lcd " .. vim.fn.fnamemodify(file,":h"))
        end
    end,
})

-- netrw settings
vim.g.netrw_keepdir = 0        -- keep CWD synced with what netrw displays
vim.g.netrw_chgwin = 2         -- change local directory for the current window
vim.g.netrw_banner = 0         -- hide banner
vim.g.netrw_liststyle = 3      -- tree-style view
vim.g.netrw_winsize = 75       -- sidebar width
vim.g.netrw_browse_split = 4   -- always open files in a new split (like a sidebar)

-- Keymaps for intuitive navigation (h/l like ranger)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        -- l: enter/open
        vim.api.nvim_buf_set_keymap(buf, "n", "l", "<CR>", { noremap = true, silent = true })
        -- h: go up directory
        vim.api.nvim_buf_set_keymap(buf, "n", "h", "-", { noremap = true, silent = true })
    end,
})

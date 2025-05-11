-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable space default behavior
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Common mapping options
local opts = { noremap = true, silent = true }

-- Save
vim.keymap.set("n", "<C-s>", "<cmd> w<CR>", opts)
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", opts) -- save without autoformat

-- Quit
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", opts)

-- Delete char without yanking
vim.keymap.set("n", "x", '"_x', opts)

-- Scroll & center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find & center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize splits
vim.keymap.set("n", "<Up>",    ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>",  ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>",  ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
vim.keymap.set("n", "<Tab>",    ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>",  ":bprevious<CR>", opts)
vim.keymap.set("n", "H",        ":bnext<CR>", opts)
vim.keymap.set("n", "L",        ":bprev<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>n",  "<cmd>enew<CR>", opts)

-- Window management
vim.keymap.set("n", "<leader>v",  "<C-w>v", opts)
vim.keymap.set("n", "<leader>h",  "<C-w>s", opts)
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts)

-- Navigate splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)

-- Toggle wrap
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Visual indent stay
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Paste without yank overwrite
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- Telescope symbols (only functions/methods)
vim.keymap.set("n", "<leader>gm", function()
  require("telescope.builtin").lsp_document_symbols({ symbols = { "Function", "Method" } })
end, opts)

-- Quick Esc in insert
vim.keymap.set("i", "jj", "<Esc>", opts)

-- LSP format
vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end,
  { desc = "Format file", noremap = true, silent = true })
vim.keymap.set("v", "<leader>cf", function()
  vim.lsp.buf.format({
    async = true,
    range = { start = vim.api.nvim_buf_get_mark(0, "<"), ["end"] = vim.api.nvim_buf_get_mark(0, ">") },
  })
end, { desc = "Format selection", noremap = true, silent = true })

-- Snacks Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end,    { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,",         function() Snacks.picker.buffers() end,  { desc = "Buffers" })
vim.keymap.set("n", "<leader>/",         function() Snacks.picker.grep() end,     { desc = "Grep" })
vim.keymap.set("n", "<leader>:",         function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>n",         function() Snacks.picker.notifications() end,   { desc = "Notification History" })
vim.keymap.set("n", "<leader>e",         function() Snacks.explorer() end,             { desc = "File Explorer" })

-- Snacks find
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end,                   { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end,                     { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end,                 { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end,                  { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end,                    { desc = "Recent" })

-- Snacks git
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end,              { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end,                   { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log_line() end,              { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end,                { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end,                 { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end,                  { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end,              { desc = "Git Log File" })

-- Snacks Grep
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end,                     { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end,             { desc = "Grep Buffers" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end,                      { desc = "Grep" })
vim.keymap.set({ "n","x" }, "<leader>sw", function() Snacks.picker.grep_word() end,        { desc = "Grep word" })

-- Snacks search
vim.keymap.set("n", '<leader>s"', function() Snacks.picker.registers() end,                { desc = "Registers" })
vim.keymap.set("n", "<leader>s/", function() Snacks.picker.search_history() end,            { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end,                  { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end,           { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end,                  { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end,               { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,        { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end,                      { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end,                { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end,                     { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end,                     { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end,                   { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.loclist() end,                  { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end,                    { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() Snacks.picker.man() end,                      { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", function() Snacks.picker.lazy() end,                     { desc = "Plugins" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end,                   { desc = "Quickfix" })
vim.keymap.set("n", "<leader>sR", function() Snacks.picker.resume() end,                    { desc = "Resume" })
vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end,                      { desc = "Undo" })
vim.keymap.set("n", "<leader>uC", function() Snacks.picker.colorschemes() end,              { desc = "Colorschemes" })

-- Snacks LSP
vim.keymap.set("n", "gd",  function() Snacks.picker.lsp_definitions() end,                 { desc = "Goto Definition" })
vim.keymap.set("n", "gD",  function() Snacks.picker.lsp_declarations() end,                { desc = "Goto Declaration" })
vim.keymap.set("n", "gr",  function() Snacks.picker.lsp_references() end,   { desc = "References", nowait = true })
vim.keymap.set("n", "gI",  function() Snacks.picker.lsp_implementations() end,             { desc = "Goto Implementation" })
vim.keymap.set("n", "gy",  function() Snacks.picker.lsp_type_definitions() end,            { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end,             { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,   { desc = "Workspace Symbols" })

-- Snacks Other
vim.keymap.set("n", "<leader>z",  function() Snacks.zen() end,                             { desc = "Toggle Zen" })
vim.keymap.set("n", "<leader>Z",  function() Snacks.zen.zoom() end,                        { desc = "Zoom Zen" })
vim.keymap.set("n", "<leader>.",  function() Snacks.scratch() end,                         { desc = "Scratch Buffer" })
vim.keymap.set("n", "<leader>S",  function() Snacks.scratch.select() end,                  { desc = "Select Scratch" })
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end,                       { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end,               { desc = "Rename File" })
vim.keymap.set({ "n","v" }, "<leader>gB", function() Snacks.gitbrowse() end,              { desc = "Git Browse" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end,                         { desc = "Lazygit" })
vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end,                   { desc = "Dismiss Notifications" })
-- in Deiner keymaps.lua
vim.keymap.set({ "n", "t" }, "<leader>ft", function()
  Snacks.terminal()
end, { desc = "Toggle Snacks Terminal" })





vim.keymap.set({ "n","t" }, "]]",  function() Snacks.words.jump(vim.v.count1) end,         { desc = "Next Reference" })
vim.keymap.set({ "n","t" }, "[[",  function() Snacks.words.jump(-vim.v.count1) end,        { desc = "Prev Reference" })
vim.keymap.set("n", "<leader>N",    function()
  Snacks.win({ file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
               width = 0.6, height = 0.6,
               wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 } })
end, { desc = "Neovim News" })

-- Ignore which-key for <c-_>
vim.keymap.set("n", "<c-_>", function() Snacks.terminal() end, { desc = "which_key_ignore" })


require "paq" {
     "savq/paq-nvim";
     "OmniSharp/omnisharp-vim";
     "dense-analysis/ale";
     "prabirshrestha/asyncomplete.vim";
}

local wo = vim.wo
local g = vim.g
local opt = vim.opt
local o = vim.o

wo.number = true -- show line numbers
g.OmniSharp_server_user_net8 = 1
g.OmniSharp_highlighting = 3 -- update highlights after all text changes?
opt.wrap = false -- no text wrap
opt.backup = false -- no backup file
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termencoding = "utf-8"

-- The following lines set the tab character to use 4 spaces, at least according to stack overflow

o.expandtab = true -- Expand Tab input with spaces
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 4 --number of space characters per tab
o.shiftwidth = 4 --spaces per indentation level

vim.cmd([[
	" Deal with unwated white spaces (shown in red)
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd BufWinLeave * call clearmatches()
]])


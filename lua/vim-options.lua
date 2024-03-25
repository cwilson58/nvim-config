local wo = vim.wo
local g = vim.g
local opt = vim.opt
local o = vim.o
local keymap = vim.keymap

g.mapleader = " " -- make the leader key space
wo.number = true -- show line numbers
opt.wrap = false -- no text wrap
opt.backup = false -- no backup file
-- Set all encoding to utf-8
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termencoding = "utf-8"

-- The following lines set the tab character to use 4 spaces, at least according to stack overflow

o.expandtab = true -- Expand Tab input with spaces
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 4 --number of space characters per tab
o.shiftwidth = 4 --spaces per indentation level

vim.cmd([[
	" Deal with unwanted white spaces (shown in red)
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd BufWinLeave * call clearmatches()
]])

vim.opt.spelllang = 'en_ca'
vim.opt.spell = true
vim.opt.spelloptions='camel'
vim.cmd([[highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00]])

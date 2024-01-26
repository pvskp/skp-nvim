local options = {

	autochdir = false,
	background = "dark",
	cmdheight = 1, -- space in the neovim command line for displaying messages
	compatible = false,
	cursorline = false, -- highlight the current line
	equalalways = false, -- I don't like my windows changing all the time
	expandtab = true, -- convert tabs to spaces

	-- Search
	hlsearch = false, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns

	linebreak = true, -- companion to wrap, don't split words
	number = true, -- the number of spaces inserted for each indentation

	-- numberwidth = 4, -- set number column width to 2 {default 4}

	path = ".,,**",
	pumblend = 0,
	relativenumber = true, -- set relative numbered lines
	scrolloff = 99999,
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	showmode = false,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true, -- make indenting smarter again

	splitbelow = true,
	splitright = true,

	swapfile = false,
	tabstop = 2,
	timeoutlen = 300,
	undofile = true,
	updatetime = 250,
	virtualedit = "all",

	--< Wildmenu >--
	wildmenu = true,
	wildignorecase = true,
	-- wildmode = "list:longest,full",

	wrap = false,
	clipboard = "unnamedplus",

	foldmethod = "indent",
	foldlevel = 1,
	foldenable = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.cmd([[set list]])
-- vim.cmd([[set listchars=tab:▸\ ,eol:↲]])

vim.g.netrw_banner = 0

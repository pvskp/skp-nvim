local options = {
	--< Search >--
	hlsearch = false, -- highlight all matches on previous search pattern
	smartcase = true,
	ignorecase = true, -- ignore case in search patterns
	number = true, -- the number of spaces inserted for each indentation

	path = ".,,**",

	--< Tabulation >--
	expandtab = true, -- convert tabs to spaces
	tabstop = 2,
	shiftwidth = 2, -- the number of spaces inserted for each indentation

	--< UI >--
	cursorcolumn = false,
	colorcolumn = "100",
	cursorline = false, -- highlight the current line
	signcolumn = "no",
	numberwidth = 2, -- set number column width to 2 {default 4}
	wrap = true,
	linebreak = true, -- companion to wrap, don't split words
	relativenumber = true, -- set relative numbered lines
	showmode = false,
	scrolloff = 99999,
	pumblend = 0,

	--< Split >--
	splitbelow = true,
	splitright = true,

	--< Wildmenu >--
	wildmenu = true,
	wildignorecase = true,
	-- wildmode = "list:longest,full",

	--< Fold >--
	foldmethod = "indent",
	foldlevel = 1,
	foldenable = false,

	--< Misc >--
	swapfile = false,
	timeoutlen = 300,
	undofile = true,
	updatetime = 250,
	virtualedit = "all",
	clipboard = "unnamedplus",
	smartindent = true, -- make indenting smarter again
	autochdir = false,
	-- background = "dark",
	cmdheight = 1, -- space in the neovim command line for displaying messages
	compatible = false,
	equalalways = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.cmd([[set listchars=tab:█\ ,trail:█]])
-- vim.cmd("set list")

vim.cmd([[set listchars=tab:▸\ ,eol:↲]])
vim.cmd([[set list]])

vim.g.netrw_banner = 0

USE_DEVICONS = true

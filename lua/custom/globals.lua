P = function(v)
	print(vim.inspect(v))
	return v
end

LAZY_PLUGIN_SPEC = {}

function Spec(item)
	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

function FormatColor(color)
	if not color then
		return nil
	end

	return string.format("#%06x", color)
end

function CopyHighlight(src, dest)
	local string_hl = vim.api.nvim_get_hl_by_name(src, true)
	vim.api.nvim_set_hl(0, dest, {
		fg = FormatColor(string_hl.foreground),
		bg = FormatColor(string_hl.background),
		bold = string_hl.bold,
		italic = string_hl.italic,
	})
end

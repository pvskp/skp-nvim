P = function(v)
	print(vim.inspect(v))
	return v
end

LAZY_PLUGIN_SPEC = {}

function Spec(item)
	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

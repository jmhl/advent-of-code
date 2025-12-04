local utils = {}

function utils.split_on_delimiter(content, delimiter)
	delimiter = delimiter or ","

	local regex = "([^" .. delimiter .. "]+)"

	return string.gmatch(content, regex)
end

return utils

file = io.open("./src/day5/input.txt", "r")

local fresh_ingredients = {}
local unique_ranges = {}

for line in file:lines() do
	if string.find(line, "-") then
		local low_s, high_s = string.match(line, "(%d+)-(%d+)")
		local low = tonumber(low_s)
		local high = tonumber(high_s)

		table.insert(fresh_ingredients, { low, high })
	end
end

table.sort(fresh_ingredients, function(i1, i2)
	local l1, h1 = table.unpack(i1)
	local l2, h2 = table.unpack(i2)

	return l1 < l2
end)

function is_in_range(val, low, high)
	return val >= low and val <= high
end

for idx, ingredients in pairs(fresh_ingredients) do
	local low, high = table.unpack(ingredients)
	local is_new_range = true

	for idx, range in pairs(unique_ranges) do
		local ex_low, ex_high = table.unpack(range)

		if is_in_range(ex_low, low, high) or is_in_range(ex_high, low, high) then
			is_new_range = false

			if ex_low < low then
				unique_ranges[idx] = { ex_low, high }
			end

			if ex_high > high then
				unique_ranges[idx] = { low, ex_high }
			end
		end
	end

	if is_new_range then
		table.insert(unique_ranges, { low, high })
	end
end

total = 0

for idx, range in pairs(unique_ranges) do
	local low, high = table.unpack(range)
	local diff = high - low + 1

	total = total + diff
	-- print(low, high, diff)
end

print(total)

file:close()

file = io.open("./src/day5/input.txt", "r")

total = 0

local fresh_ingredients = {}

for line in file:lines() do
	if string.find(line, "-") then
		local low_s, high_s = string.match(line, "(%d+)-(%d+)")

		local low = tonumber(low_s)
		local high = tonumber(high_s)

		table.insert(fresh_ingredients, { low, high })
	elseif line ~= "" then
		local num = tonumber(line)

		local is_fresh = false;

		for idx, range in pairs(fresh_ingredients) do
			local low, high = table.unpack(range)

			if num >= low and num <= high then
				is_fresh = true
			end
		end

		if is_fresh then
			total = total + 1
		end
	end
end

print(total)

file:close()

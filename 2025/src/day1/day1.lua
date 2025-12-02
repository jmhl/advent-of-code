file = io.open("./src/day1/input.txt", "r")

local position = 50
local occurrences_of_zero = 0

for line in file:lines() do
	local dir, num_s = string.match(line, "(%w)(%d+)")
	local num = tonumber(num_s) % 100

	local intermediate_value

	if dir == "L" then
		intermediate_value = position - num
	else
		intermediate_value = position + num
	end

	if intermediate_value > 99 then
		local difference = intermediate_value - 99 - 1
		position = difference
	elseif intermediate_value < 0 then
		local difference = 99 + intermediate_value + 1
		position = difference
	else
		position = intermediate_value
	end

	if position == 0 then
		occurrences_of_zero = occurrences_of_zero + 1
	end

	print("Command: " .. line .. " | Position: " .. position)
end

print("---")
print("Passed 0 count:", occurrences_of_zero)

file:close()

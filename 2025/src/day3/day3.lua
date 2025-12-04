file = io.open("./src/day3/input.txt", "r")

local total = 0

for line in file:lines() do
	local largest = 0

	for i = 1, #line do
		local curr_num_s = line:sub(i, i)

		for j = i + 1, #line do
			local next_num_s = line:sub(j, j)
			local num = tonumber("" .. curr_num_s .. next_num_s .. "")

			if (num > 9 and num > largest) then
				largest = num
			end
		end
	end

	total = total + largest
end

file:close()

print(total)

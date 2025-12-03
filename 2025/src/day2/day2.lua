file = io.open("./src/day2/input.txt", "r")

local content = file:read"*a"

file:close()

local total = 0

for id_range in string.gmatch(content, "([^,]+)") do
	local start_s, stop_s = string.match(id_range, "(%d+)-(%d+)")

	local start = tonumber(start_s)
	local stop = tonumber(stop_s)

	for num = start, stop do
		local num_s = tostring(num)

		local first_half = string.sub(num_s, 0, #num_s // 2)
		local second_half = string.sub(num_s, #num_s // 2 + 1, -1)

		if first_half == second_half then
			print(num)
			total = total + num
		end
	end
end

print(total)

utils = require("src.utils")

file = io.open("./src/day2/test_input.txt", "r")

local content = file:read"*a"

file:close()

local total = 0

for id_range in utils.split_on_delimiter(content) do
	local start_s, stop_s = string.match(id_range, "(%d+)-(%d+)")

	local start = tonumber(start_s)
	local stop = tonumber(stop_s)

	for num = start, stop do
		local num_s = tostring(num)

		local len = #num_s
		local limit = len // 2

		for sub_num = 1, limit do
			if len % sub_num == 0 then
				local substr = string.sub(num_s, 0, sub_num)

				local repeated_substr = string.rep(substr, len / sub_num)

				if repeated_substr == num_s then
					total = total + num
					break
				end
			end
		end
	end
end

print(total)
